namespace ProjectsService.Application.DTOs;

/// <summary>Unvalidated input. Any field may be missing.</summary>
public sealed record ProjectDataDto
{
    public string? Title { get; init; }
    public string? Description { get; init; }
    public string? Status { get; init; }
    public string? Priority { get; init; }
    public string? ProjectType { get; init; }
    public string? Client { get; init; }
    public string? Department { get; init; }
    public string? Manager { get; init; }
    public DateOnly? Start { get; init; }
    public DateOnly? End { get; init; }
    public decimal? Funding { get; init; }
}
