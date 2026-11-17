namespace ProjectsService.Domain;

public static class ProjectStatuses
{
    public static IReadOnlyList<string> All { get; } = ["Planned", "Active", "On Hold", "Completed", "Cancelled"];
}
