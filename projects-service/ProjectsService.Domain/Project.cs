namespace ProjectsService.Domain;

/// <summary>Id is the project code, such as INE-25-0013.</summary>
public sealed record Project
{
    public required string Id { get; init; }
    public required string Title { get; init; }
    public required string Description { get; init; }
    public required string Status { get; init; }
    public required string Priority { get; init; }
    public required string ProjectType { get; init; }
    public required string Client { get; init; }
    public required string Department { get; init; }
    public required string Manager { get; init; }
    public required DateOnly Start { get; init; }
    public required DateOnly End { get; init; }

    /// <summary>Approved funding, in euros. Null when unknown.</summary>
    public decimal? Funding { get; init; }

    public IReadOnlyList<int> ResearcherIds { get; init; } = [];

    /// <summary>In UTC. The database sets it on every save.</summary>
    public DateTime UpdatedAt { get; init; }
}
