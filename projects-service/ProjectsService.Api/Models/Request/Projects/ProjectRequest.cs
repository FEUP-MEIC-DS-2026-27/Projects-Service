using ProjectsService.Application.DTOs;

namespace ProjectsService.Api.Models.Request.Projects;

public sealed record ProjectRequest
{
    /// <summary>The project code. Required on POST. On PUT, leave it out or repeat the one in the URL.</summary>
    public string? Id { get; init; }

    public string? Title { get; init; }

    public string? Description { get; init; }

    /// <summary>Planned, Active, On Hold, Completed or Cancelled.</summary>
    public string? Status { get; init; }

    /// <summary>Low, Medium, High or Critical.</summary>
    public string? Priority { get; init; }

    public string? ProjectType { get; init; }

    public string? Client { get; init; }

    public string? Department { get; init; }

    /// <summary>First and last name.</summary>
    public string? Manager { get; init; }

    public DateOnly? Start { get; init; }

    /// <summary>On or after start.</summary>
    public DateOnly? End { get; init; }

    /// <summary>Approved funding, in euros. Optional.</summary>
    public decimal? Funding { get; init; }

    public int[] GrantIds { get; init; } = [];

    public IReadOnlyList<int>? ResearcherIds { get; init; }

    public ProjectDataDto ToDto() => new()
    {
        Title = Title,
        Description = Description,
        Status = Status,
        Priority = Priority,
        ProjectType = ProjectType,
        GrantIds = GrantIds,
        Client = Client,
        Department = Department,
        Manager = Manager,
        Start = Start,
        End = End,
        Funding = Funding,
        ResearcherIds = ResearcherIds
    };
}
