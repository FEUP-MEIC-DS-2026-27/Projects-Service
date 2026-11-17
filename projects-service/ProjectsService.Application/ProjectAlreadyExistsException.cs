namespace ProjectsService.Application;

/// <summary>Another project already has this code. The API answers 409.</summary>
public sealed class ProjectAlreadyExistsException(string id) : Exception($"Project '{id}' already exists.");
