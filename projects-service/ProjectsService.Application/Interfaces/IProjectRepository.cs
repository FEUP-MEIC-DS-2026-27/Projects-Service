using ProjectsService.Domain;

namespace ProjectsService.Application.Interfaces;

public interface IProjectRepository
{
    /// <summary>Ordered by start date, then id.</summary>
    Task<IReadOnlyList<Project>> ListAsync(CancellationToken cancellationToken = default);

    Task<Project?> GetAsync(string id, CancellationToken cancellationToken = default);

    /// <summary>The saved project, with its UpdatedAt. Null when the id is taken.</summary>
    Task<Project?> AddAsync(Project project, CancellationToken cancellationToken = default);

    /// <summary>The saved project, with its UpdatedAt. Null when no project has the id.</summary>
    Task<Project?> UpdateAsync(Project project, CancellationToken cancellationToken = default);

    /// <summary>False when no project has the id.</summary>
    Task<bool> DeleteAsync(string id, CancellationToken cancellationToken = default);
}
