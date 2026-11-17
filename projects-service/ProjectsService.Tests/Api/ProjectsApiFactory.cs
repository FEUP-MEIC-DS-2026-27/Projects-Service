using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using ProjectsService.Application.Interfaces;
using ProjectsService.Tests.Fakes;

namespace ProjectsService.Tests.Api;

public sealed class ProjectsApiFactory : WebApplicationFactory<Program>
{
    public const string ShellOrigin = "http://localhost:3000";

    public InMemoryProjectRepository Repository { get; } = new();

    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        builder.UseSetting("CORS_ORIGINS", ShellOrigin);
        builder.UseSetting("ConnectionStrings:ProjectsDb", "Host=localhost");
        builder.ConfigureServices(services =>
            services.Replace(ServiceDescriptor.Singleton<IProjectRepository>(Repository)));
    }
}
