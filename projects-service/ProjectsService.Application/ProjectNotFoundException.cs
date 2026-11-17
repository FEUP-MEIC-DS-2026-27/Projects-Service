namespace ProjectsService.Application;

/// <summary>The API answers 404.</summary>
public sealed class ProjectNotFoundException(string id) : Exception($"Project '{id}' not found.");
