using ProjectsService.Application.Interfaces;
using ProjectsService.Domain;

namespace ProjectsService.Tests.Fakes;

public sealed class InMemoryProjectRepository : IProjectRepository
{
    private readonly Dictionary<string, Project> _projects = [];
    private readonly Lock _gate = new();

    public Task<IReadOnlyList<Project>> ListAsync(CancellationToken cancellationToken = default)
    {
        lock (_gate)
            return Task.FromResult<IReadOnlyList<Project>>([.. _projects.Values.OrderBy(p => p.Start).ThenBy(p => p.Id, StringComparer.Ordinal)]);
    }

    public Task<Project?> GetAsync(string id, CancellationToken cancellationToken = default)
    {
        lock (_gate)
            return Task.FromResult(_projects.GetValueOrDefault(id));
    }

    public Task<Project?> AddAsync(Project project, CancellationToken cancellationToken = default)
    {
        lock (_gate)
        {
            var saved = project with { UpdatedAt = DateTime.UtcNow };
            return Task.FromResult(_projects.TryAdd(project.Id, saved) ? saved : null);
        }
    }

    public Task<Project?> UpdateAsync(Project project, CancellationToken cancellationToken = default)
    {
        lock (_gate)
        {
            if (!_projects.ContainsKey(project.Id))
                return Task.FromResult<Project?>(null);
            var saved = project with { UpdatedAt = DateTime.UtcNow };
            _projects[project.Id] = saved;
            return Task.FromResult<Project?>(saved);
        }
    }

    public Task<bool> DeleteAsync(string id, CancellationToken cancellationToken = default)
    {
        lock (_gate)
            return Task.FromResult(_projects.Remove(id));
    }
}
