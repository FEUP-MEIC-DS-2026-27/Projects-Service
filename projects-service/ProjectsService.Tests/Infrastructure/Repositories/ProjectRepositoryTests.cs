using Npgsql;
using ProjectsService.Infrastructure.Repositories;
using ProjectsService.Tests.Fakes;

namespace ProjectsService.Tests.Infrastructure.Repositories;

/// <summary>Needs the schema and the mock data. Deletes the projects it creates.</summary>
public class ProjectRepositoryTests : IAsyncLifetime
{
    private readonly string _testId = $"TEST-{Guid.NewGuid():N}"[..30];

    private NpgsqlDataSource _dataSource = null!;
    private ProjectRepository _repository = null!;

    public Task InitializeAsync()
    {
        var connectionString = Environment.GetEnvironmentVariable(PostgresFactAttribute.ConnectionStringVariable);
        if (!string.IsNullOrWhiteSpace(connectionString))
        {
            _dataSource = NpgsqlDataSource.Create(connectionString);
            _repository = new ProjectRepository(_dataSource);
        }
        return Task.CompletedTask;
    }

    public async Task DisposeAsync()
    {
        if (_dataSource is null)
            return;
        await _repository.DeleteAsync(_testId);
        await _dataSource.DisposeAsync();
    }

    [PostgresFact]
    public async Task GetAsync_ReadsAMockProject()
    {
        var project = await _repository.GetAsync("INE-25-0013");

        Assert.NotNull(project);
        Assert.StartsWith("Solar Power Installation - Hamburg", project.Title);
        Assert.Equal("Matilde Ribeiro", project.Manager);
        Assert.NotNull(project.Funding);
        Assert.Equal([15, 18, 24, 27], project.ResearcherIds);
        Assert.Equal(new DateTime(2026, 9, 18, 12, 0, 0, DateTimeKind.Utc), project.UpdatedAt);
    }

    [PostgresFact]
    public async Task ListAsync_OrdersByStartDate()
    {
        var projects = await _repository.ListAsync();

        Assert.True(projects.Count >= 75);
        Assert.Equal(projects.OrderBy(p => p.Start).Select(p => p.Start), projects.Select(p => p.Start));
    }

    [PostgresFact]
    public async Task AddUpdateDelete_RoundTrip()
    {
        var project = Projects.Valid(_testId);

        var added = await _repository.AddAsync(project);
        Assert.NotNull(added);
        Assert.Null(await _repository.AddAsync(project));
        Assert.Equal(project with { UpdatedAt = added.UpdatedAt, ResearcherIds = added.ResearcherIds }, added);
        var fetchedAdded = await _repository.GetAsync(_testId);
        Assert.NotNull(fetchedAdded);
        Assert.Equal(added.ResearcherIds, fetchedAdded.ResearcherIds);
        Assert.Equivalent(added, fetchedAdded);
        Assert.InRange(added.UpdatedAt, DateTime.UtcNow.AddMinutes(-1), DateTime.UtcNow.AddMinutes(1));

        var onHold = project with
        {
            Status = "On Hold",
            End = new DateOnly(2027, 1, 1),
            Funding = null
        };

        var updated = await _repository.UpdateAsync(onHold);
        Assert.NotNull(updated);
        Assert.Equal(onHold with { UpdatedAt = updated.UpdatedAt, ResearcherIds = updated.ResearcherIds }, updated);
        Assert.True(updated.UpdatedAt >= added.UpdatedAt);
        var fetchedUpdated = await _repository.GetAsync(_testId);
        Assert.NotNull(fetchedUpdated);
        Assert.Equal(updated.ResearcherIds, fetchedUpdated.ResearcherIds);
        Assert.Equivalent(updated, fetchedUpdated);

        Assert.True(await _repository.DeleteAsync(_testId));
        Assert.False(await _repository.DeleteAsync(_testId));
        Assert.Null(await _repository.GetAsync(_testId));
    }

    [PostgresFact]
    public async Task UpdateAsync_WithAnUnknownId_ReturnsFalse()
    {
        Assert.Null(await _repository.UpdateAsync(Projects.Valid(_testId)));
    }

    [PostgresFact]
    public async Task GrantLinks_SurviveUpdatesAndCascadeOnDelete()
    {
        var created = await _repository.AddAsync(Projects.Valid(_testId));

        Assert.NotNull(created);
        Assert.Empty(created.GrantIds);

        await using (var insert = _dataSource.CreateCommand("""
            INSERT INTO project_grants (project_id, grant_id)
            VALUES (@projectId, -1001), (@projectId, -1002)
            """))
        {
            insert.Parameters.AddWithValue("projectId", _testId);
            await insert.ExecuteNonQueryAsync();
        }

        int[] expected = [-1002, -1001];

        var project = await _repository.GetAsync(_testId);
        Assert.NotNull(project);
        Assert.Equal(expected, project.GrantIds);

        var projects = await _repository.ListAsync();
        var listed = Assert.Single(projects, p => p.Id == _testId);
        Assert.Equal(expected, listed.GrantIds);

        var updated = await _repository.UpdateAsync(
            Projects.Valid(_testId) with { Title = "Updated project" });

        Assert.NotNull(updated);
        Assert.Equal("Updated project", updated.Title);
        Assert.Equal(expected, updated.GrantIds);

        var fetched = await _repository.GetAsync(_testId);
        Assert.NotNull(fetched);
        Assert.Equal(expected, fetched.GrantIds);

        Assert.True(await _repository.DeleteAsync(_testId));

        await using var remaining = _dataSource.CreateCommand("""
            SELECT grant_id
            FROM project_grants
            WHERE project_id = @projectId
            """);

        remaining.Parameters.AddWithValue("projectId", _testId);
        Assert.Null(await remaining.ExecuteScalarAsync());
    }
}
