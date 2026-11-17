using ProjectsService.Application.DTOs;
using ProjectsService.Domain;

namespace ProjectsService.Application.Interfaces;

public interface IProjectApplicationService
{
    Task<IReadOnlyList<Project>> ListAsync(CancellationToken cancellationToken = default);

    /// <exception cref="ProjectNotFoundException"></exception>
    Task<Project> GetAsync(string id, CancellationToken cancellationToken = default);

    /// <exception cref="InvalidProjectException"></exception>
    /// <exception cref="ProjectAlreadyExistsException"></exception>
    Task<Project> CreateAsync(string? id, ProjectDataDto data, CancellationToken cancellationToken = default);

    /// <exception cref="InvalidProjectException"></exception>
    /// <exception cref="ProjectNotFoundException"></exception>
    Task<Project> UpdateAsync(string id, ProjectDataDto data, CancellationToken cancellationToken = default);

    /// <exception cref="ProjectNotFoundException"></exception>
    Task DeleteAsync(string id, CancellationToken cancellationToken = default);
}
