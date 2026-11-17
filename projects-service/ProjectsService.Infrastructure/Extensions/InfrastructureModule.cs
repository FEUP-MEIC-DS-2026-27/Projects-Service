using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Npgsql;
using ProjectsService.Application.Interfaces;
using ProjectsService.Infrastructure.Repositories;

namespace ProjectsService.Infrastructure.Extensions;

public static class InfrastructureModule
{
    public const string ConnectionStringName = "ProjectsDb";

    public static IServiceCollection AddInfrastructureModule(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSingleton(_ => NpgsqlDataSource.Create(
            configuration.GetConnectionString(ConnectionStringName)
            ?? throw new InvalidOperationException($"ConnectionStrings:{ConnectionStringName} is required.")));

        services.AddScoped<IProjectRepository, ProjectRepository>();

        return services;
    }
}
