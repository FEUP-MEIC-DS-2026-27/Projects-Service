namespace ProjectsService.Domain;

public static class ProjectPriorities
{
    public static IReadOnlyList<string> All { get; } = ["Low", "Medium", "High", "Critical"];
}
