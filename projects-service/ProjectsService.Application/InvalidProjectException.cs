namespace ProjectsService.Application;

/// <summary>The project can't be saved as given. The API answers 400.</summary>
public sealed class InvalidProjectException(string message) : Exception(message);
