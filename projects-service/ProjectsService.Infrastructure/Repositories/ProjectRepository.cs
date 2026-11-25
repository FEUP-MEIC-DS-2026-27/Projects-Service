using Npgsql;
using NpgsqlTypes;
using ProjectsService.Application.Interfaces;
using ProjectsService.Domain;

namespace ProjectsService.Infrastructure.Repositories;

public sealed class ProjectRepository : IProjectRepository
{
    private const string BaseColumns =
        "id, title, description, status, priority, project_type, client, department, manager, start_date, end_date, funding, updated_at";

    private const string Columns =
        BaseColumns + """
        ,
        COALESCE((SELECT array_agg(pr.researcher_id ORDER BY pr.researcher_id)
                  FROM project_researchers pr
                  WHERE pr.project_id = projects.id),
                 ARRAY[]::integer[]) AS researcher_ids
        """;

    private readonly NpgsqlDataSource _dataSource;

    public ProjectRepository(NpgsqlDataSource dataSource)
    {
        _dataSource = dataSource;
    }

    public async Task<IReadOnlyList<Project>> ListAsync(CancellationToken cancellationToken = default)
    {
        await using var command = _dataSource.CreateCommand($"SELECT {Columns} FROM projects ORDER BY start_date, id");
        await using var reader = await command.ExecuteReaderAsync(cancellationToken);

        var projects = new List<Project>();
        while (await reader.ReadAsync(cancellationToken))
            projects.Add(Read(reader));
        return projects;
    }

    public async Task<Project?> GetAsync(string id, CancellationToken cancellationToken = default)
    {
        await using var command = _dataSource.CreateCommand($"SELECT {Columns} FROM projects WHERE id = @id");
        command.Parameters.Add(Text("id", id));

        return await ReadSingleAsync(command, cancellationToken);
    }

    public async Task<Project?> AddAsync(Project project, CancellationToken cancellationToken = default)
    {
        await using var connection = await _dataSource.OpenConnectionAsync(cancellationToken);
        await using var transaction = await connection.BeginTransactionAsync(cancellationToken);

        await using var command = connection.CreateCommand();
        command.Transaction = transaction;
        command.CommandText = $"""
            INSERT INTO projects (id, title, description, status, priority, project_type, client, department, manager, start_date, end_date, funding)
            VALUES (@id, @title, @description, @status, @priority, @projectType, @client, @department, @manager, @start, @end, @funding)
            ON CONFLICT (id) DO NOTHING
            RETURNING {BaseColumns}
            """;
        AddParameters(command, project);

        var saved = await ReadSingleAsync(command, cancellationToken);
        if (saved is null)
        {
            await transaction.RollbackAsync(cancellationToken);
            return null;
        }

        await ReplaceResearchersAsync(connection, transaction, project.Id, project.ResearcherIds, cancellationToken);
        await transaction.CommitAsync(cancellationToken);
        return saved with { ResearcherIds = project.ResearcherIds };
    }

    public async Task<Project?> UpdateAsync(Project project, CancellationToken cancellationToken = default)
    {
        await using var connection = await _dataSource.OpenConnectionAsync(cancellationToken);
        await using var transaction = await connection.BeginTransactionAsync(cancellationToken);

        await using var command = connection.CreateCommand();
        command.Transaction = transaction;
        command.CommandText = $"""
            UPDATE projects
            SET title = @title,
                description = @description,
                status = @status,
                priority = @priority,
                project_type = @projectType,
                client = @client,
                department = @department,
                manager = @manager,
                start_date = @start,
                end_date = @end,
                funding = @funding,
                updated_at = now() AT TIME ZONE 'UTC'
            WHERE id = @id
            RETURNING {BaseColumns}
            """;
        AddParameters(command, project);

        var saved = await ReadSingleAsync(command, cancellationToken);
        if (saved is null)
        {
            await transaction.RollbackAsync(cancellationToken);
            return null;
        }

        await ReplaceResearchersAsync(connection, transaction, project.Id, project.ResearcherIds, cancellationToken);
        await transaction.CommitAsync(cancellationToken);
        return saved with { ResearcherIds = project.ResearcherIds };
    }

    public async Task<bool> DeleteAsync(string id, CancellationToken cancellationToken = default)
    {
        await using var command = _dataSource.CreateCommand("DELETE FROM projects WHERE id = @id");
        command.Parameters.Add(Text("id", id));

        return await command.ExecuteNonQueryAsync(cancellationToken) == 1;
    }

    private static async Task<Project?> ReadSingleAsync(NpgsqlCommand command, CancellationToken cancellationToken)
    {
        await using var reader = await command.ExecuteReaderAsync(cancellationToken);
        return await reader.ReadAsync(cancellationToken) ? Read(reader) : null;
    }

    private static Project Read(NpgsqlDataReader reader) => new()
    {
        Id = reader.GetString(0),
        Title = reader.GetString(1),
        Description = reader.GetString(2),
        Status = reader.GetString(3),
        Priority = reader.GetString(4),
        ProjectType = reader.GetString(5),
        Client = reader.GetString(6),
        Department = reader.GetString(7),
        Manager = reader.GetString(8),
        Start = reader.GetFieldValue<DateOnly>(9),
        End = reader.GetFieldValue<DateOnly>(10),
        Funding = reader.IsDBNull(11) ? null : reader.GetDecimal(11),
        UpdatedAt = DateTime.SpecifyKind(reader.GetDateTime(12), DateTimeKind.Utc),
        ResearcherIds = reader.FieldCount > 13 ? reader.GetFieldValue<int[]>(13) : []
    };

    private static async Task ReplaceResearchersAsync(
        NpgsqlConnection connection,
        NpgsqlTransaction transaction,
        string projectId,
        IReadOnlyList<int> researcherIds,
        CancellationToken cancellationToken)
    {
        await using (var delete = connection.CreateCommand())
        {
            delete.Transaction = transaction;
            delete.CommandText = "DELETE FROM project_researchers WHERE project_id = @projectId";
            delete.Parameters.Add(Text("projectId", projectId));
            await delete.ExecuteNonQueryAsync(cancellationToken);
        }

        foreach (var researcherId in researcherIds)
        {
            await using var insert = connection.CreateCommand();
            insert.Transaction = transaction;
            insert.CommandText = """
                INSERT INTO project_researchers (project_id, researcher_id)
                VALUES (@projectId, @researcherId)
                """;
            insert.Parameters.Add(Text("projectId", projectId));
            insert.Parameters.Add(new NpgsqlParameter("researcherId", NpgsqlDbType.Integer) { Value = researcherId });
            await insert.ExecuteNonQueryAsync(cancellationToken);
        }
    }

    private static void AddParameters(NpgsqlCommand command, Project project)
    {
        command.Parameters.Add(Text("id", project.Id));
        command.Parameters.Add(Text("title", project.Title));
        command.Parameters.Add(Text("description", project.Description));
        command.Parameters.Add(Text("status", project.Status));
        command.Parameters.Add(Text("priority", project.Priority));
        command.Parameters.Add(Text("projectType", project.ProjectType));
        command.Parameters.Add(Text("client", project.Client));
        command.Parameters.Add(Text("department", project.Department));
        command.Parameters.Add(Text("manager", project.Manager));
        command.Parameters.Add(new NpgsqlParameter("start", NpgsqlDbType.Date) { Value = project.Start });
        command.Parameters.Add(new NpgsqlParameter("end", NpgsqlDbType.Date) { Value = project.End });
        command.Parameters.Add(new NpgsqlParameter("funding", NpgsqlDbType.Numeric) { Value = (object?)project.Funding ?? DBNull.Value });
    }

    private static NpgsqlParameter Text(string name, string value) => new(name, NpgsqlDbType.Text) { Value = value };
}
