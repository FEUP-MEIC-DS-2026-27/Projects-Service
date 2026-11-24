using System.Text.RegularExpressions;
using ProjectsService.Application.DTOs;
using ProjectsService.Application.Interfaces;
using ProjectsService.Domain;

namespace ProjectsService.Application.Services;

public sealed partial class ProjectApplicationService : IProjectApplicationService
{
    public const int MaxIdLength = 30;
    public const int MaxTitleLength = 200;
    public const int MaxProjectTypeLength = 80;
    public const int MaxClientLength = 150;
    public const int MaxDepartmentLength = 100;
    public const int MaxManagerLength = 160;

    private readonly IProjectRepository _repository;

    public ProjectApplicationService(IProjectRepository repository)
    {
        _repository = repository;
    }

    public Task<IReadOnlyList<Project>> ListAsync(CancellationToken cancellationToken = default) =>
        _repository.ListAsync(cancellationToken);

    public async Task<Project> GetAsync(string id, CancellationToken cancellationToken = default) =>
        await _repository.GetAsync(id, cancellationToken) ?? throw new ProjectNotFoundException(id);

    public async Task<Project> CreateAsync(string? id, ProjectDataDto data, CancellationToken cancellationToken = default)
    {
        var project = Validate(ValidateId(id), data);
        return await _repository.AddAsync(project, cancellationToken)
            ?? throw new ProjectAlreadyExistsException(project.Id);
    }

    public async Task<Project> UpdateAsync(string id, ProjectDataDto data, CancellationToken cancellationToken = default)
    {
        return await _repository.UpdateAsync(Validate(id, data), cancellationToken)
            ?? throw new ProjectNotFoundException(id);
    }

    public async Task DeleteAsync(string id, CancellationToken cancellationToken = default)
    {
        if (!await _repository.DeleteAsync(id, cancellationToken))
            throw new ProjectNotFoundException(id);
    }

    private static string ValidateId(string? id)
    {
        id = id?.Trim();
        if (string.IsNullOrEmpty(id))
            throw new InvalidProjectException("id is required.");
        if (id.Length > MaxIdLength)
            throw new InvalidProjectException($"id can have at most {MaxIdLength} characters.");
        if (!ProjectCode().IsMatch(id))
            throw new InvalidProjectException("id can only have letters, digits, '.', '_' and '-', and must start with a letter or digit.");
        return id;
    }

    private static Project Validate(string id, ProjectDataDto data)
    {
        var status = Required("status", data.Status, int.MaxValue);
        if (!ProjectStatuses.All.Contains(status))
            throw new InvalidProjectException($"Unknown status '{status}'. Use {string.Join(", ", ProjectStatuses.All)}.");

        var priority = Required("priority", data.Priority, int.MaxValue);
        if (!ProjectPriorities.All.Contains(priority))
            throw new InvalidProjectException($"Unknown priority '{priority}'. Use {string.Join(", ", ProjectPriorities.All)}.");

        var start = data.Start ?? throw new InvalidProjectException("start is required.");
        var end = data.End ?? throw new InvalidProjectException("end is required.");
        if (end < start)
            throw new InvalidProjectException("end cannot be before start.");
        if (data.Funding < 0)
            throw new InvalidProjectException("funding cannot be negative.");

        var researcherIds = data.ResearcherIds?.Distinct().Order().ToArray() ?? [];
        if (researcherIds.Any(id => id <= 0))
            throw new InvalidProjectException("researcherIds must contain positive integers.");

        return new Project
        {
            Id = id,
            Title = Required("title", data.Title, MaxTitleLength),
            Description = data.Description?.Trim() ?? "",
            Status = status,
            Priority = priority,
            ProjectType = Required("projectType", data.ProjectType, MaxProjectTypeLength),
            Client = Required("client", data.Client, MaxClientLength),
            Department = Required("department", data.Department, MaxDepartmentLength),
            Manager = Required("manager", data.Manager, MaxManagerLength),
            Start = start,
            End = end,
            Funding = data.Funding,
            ResearcherIds = researcherIds
        };
    }

    private static string Required(string field, string? value, int maxLength)
    {
        value = value?.Trim();
        if (string.IsNullOrEmpty(value))
            throw new InvalidProjectException($"{field} is required.");
        if (value.Length > maxLength)
            throw new InvalidProjectException($"{field} can have at most {maxLength} characters.");
        return value;
    }

    [GeneratedRegex("^[A-Za-z0-9][A-Za-z0-9._-]*$")]
    private static partial Regex ProjectCode();
}
