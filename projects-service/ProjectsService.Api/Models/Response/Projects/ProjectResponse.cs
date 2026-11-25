using ProjectsService.Domain;

namespace ProjectsService.Api.Models.Response.Projects;

public sealed record ProjectResponse
{
    /// <summary>The project code.</summary>
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

    public required IReadOnlyList<int> ResearcherIds { get; init; }

    /// <summary>In UTC. Set by the service.</summary>
    public required DateTime UpdatedAt { get; init; }

    public static ProjectResponse FromDomain(Project project) => new()
    {
        Id = project.Id,
        Title = project.Title,
        Description = project.Description,
        Status = project.Status,
        Priority = project.Priority,
        ProjectType = project.ProjectType,
        Client = project.Client,
        Department = project.Department,
        Manager = project.Manager,
        Start = project.Start,
        End = project.End,
        Funding = project.Funding,
        ResearcherIds = project.ResearcherIds,
        UpdatedAt = project.UpdatedAt
    };
}
