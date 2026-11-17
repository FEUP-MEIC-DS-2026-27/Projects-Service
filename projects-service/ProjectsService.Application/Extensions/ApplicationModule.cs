using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ProjectsService.Application.Interfaces;
using ProjectsService.Application.Services;

namespace ProjectsService.Application.Extensions;

public static class ApplicationModule
{
    public static IServiceCollection AddApplicationModule(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddScoped<IProjectApplicationService, ProjectApplicationService>();
        return services;
    }
}
