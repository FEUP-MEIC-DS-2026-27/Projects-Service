using System.Net;

namespace ProjectsService.Tests.Api;

public class ApiConventionsTests : IClassFixture<ProjectsApiFactory>
{
    private readonly ProjectsApiFactory _factory;

    public ApiConventionsTests(ProjectsApiFactory factory)
    {
        _factory = factory;
    }

    [Fact]
    public async Task UnknownRoute_AnswersWithProblemDetails()
    {
        var response = await _factory.CreateClient().GetAsync("/api/nothing-here");

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
        Assert.Equal("application/problem+json", response.Content.Headers.ContentType?.MediaType);
    }

    [Fact]
    public async Task HealthLive_DoesNotTouchTheDatabase()
    {
        var response = await _factory.CreateClient().GetAsync("/health/live");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public async Task Projects_AllowsTheConfiguredOrigin()
    {
        var request = new HttpRequestMessage(HttpMethod.Get, "/api/projects");
        request.Headers.Add("Origin", ProjectsApiFactory.ShellOrigin);

        var response = await _factory.CreateClient().SendAsync(request);

        Assert.Equal([ProjectsApiFactory.ShellOrigin], response.Headers.GetValues("Access-Control-Allow-Origin"));
    }

    [Fact]
    public async Task Projects_AllowsWritesFromTheConfiguredOrigin()
    {
        var request = new HttpRequestMessage(HttpMethod.Options, "/api/projects/p-1");
        request.Headers.Add("Origin", ProjectsApiFactory.ShellOrigin);
        request.Headers.Add("Access-Control-Request-Method", "PUT");
        request.Headers.Add("Access-Control-Request-Headers", "content-type");

        var response = await _factory.CreateClient().SendAsync(request);

        Assert.Contains("PUT", response.Headers.GetValues("Access-Control-Allow-Methods").Single());
    }

    [Fact]
    public async Task Projects_DoesNotAllowOtherOrigins()
    {
        var request = new HttpRequestMessage(HttpMethod.Get, "/api/projects");
        request.Headers.Add("Origin", "http://example.org");

        var response = await _factory.CreateClient().SendAsync(request);

        Assert.False(response.Headers.Contains("Access-Control-Allow-Origin"));
    }
}
