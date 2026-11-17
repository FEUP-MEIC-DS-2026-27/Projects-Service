namespace ProjectsService.Tests.Fakes;

/// <summary>Runs only when PROJECTS_TEST_DB holds a Postgres connection string.</summary>
public sealed class PostgresFactAttribute : FactAttribute
{
    public const string ConnectionStringVariable = "PROJECTS_TEST_DB";

    public PostgresFactAttribute()
    {
        if (string.IsNullOrWhiteSpace(Environment.GetEnvironmentVariable(ConnectionStringVariable)))
            Skip = $"{ConnectionStringVariable} is not set.";
    }
}
