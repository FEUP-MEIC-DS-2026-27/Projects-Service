using System.Net;
using System.Net.Http.Json;
using ProjectsService.Api.Models.Response.Projects;
using ProjectsService.Tests.Fakes;

namespace ProjectsService.Tests.Api.Controllers;

public class ProjectsControllerTests : IClassFixture<ProjectsApiFactory>
{
    private readonly ProjectsApiFactory _factory;
    private readonly HttpClient _client;

    public ProjectsControllerTests(ProjectsApiFactory factory)
    {
        _factory = factory;
        _client = factory.CreateClient();
    }

    private static object Body(string? id) => new
    {
        id,
        title = "Solar Power Installation - Hamburg #13",
        description = "Rooftop panels",
        status = "Active",
        priority = "High",
        projectType = "Energy",
        client = "Atlantic Energy Solutions",
        department = "Engineering",
        manager = "Matilde Ribeiro",
        start = "2025-03-01",
        end = "2026-02-28",
        funding = 125000.50m,
        researcherIds = new[] { 1, 2 }
    };

    [Fact]
    public async Task Post_CreatesTheProjectWithALocation()
    {
        var response = await _client.PostAsJsonAsync("/api/projects", Body("INE-25-0013"));

        Assert.Equal(HttpStatusCode.Created, response.StatusCode);
        Assert.Equal("/api/projects/INE-25-0013", response.Headers.Location?.AbsolutePath);
        var project = await response.Content.ReadFromJsonAsync<ProjectResponse>();
        Assert.Equal(Projects.Valid("INE-25-0013").Title, project?.Title);
    }

    [Fact]
    public async Task Get_ReturnsTheWikiShapeInCamelCase()
    {
        await _factory.Repository.AddAsync(Projects.Valid("INE-25-0001"));

        var body = await _client.GetStringAsync("/api/projects/INE-25-0001");

        Assert.Contains("\"id\":\"INE-25-0001\"", body);
        Assert.Contains("\"projectType\":\"Energy\"", body);
        Assert.Contains("\"start\":\"2025-03-01\"", body);
        Assert.Contains("\"end\":\"2026-02-28\"", body);
        Assert.Contains("\"funding\":125000.50", body);
        Assert.Contains("\"researcherIds\":[1,2]", body);
        Assert.Matches("\"updatedAt\":\"[0-9T:.-]+Z\"", body);
    }

    [Fact]
    public async Task List_ReturnsEveryProject()
    {
        await _factory.Repository.AddAsync(Projects.Valid("list-1"));

        var projects = await _client.GetFromJsonAsync<List<ProjectResponse>>("/api/projects");

        Assert.Contains("list-1", projects?.Select(p => p.Id) ?? []);
    }

    [Fact]
    public async Task Put_ReplacesTheProject()
    {
        await _factory.Repository.AddAsync(Projects.Valid("put-1"));

        var response = await _client.PutAsJsonAsync("/api/projects/put-1", Body(null));

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public async Task Put_WithTheSameIdInTheBody_IsAccepted()
    {
        await _factory.Repository.AddAsync(Projects.Valid("put-2"));

        var response = await _client.PutAsJsonAsync("/api/projects/put-2", Body("put-2"));

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public async Task Put_WithADifferentIdInTheBody_AnswersBadRequest()
    {
        await _factory.Repository.AddAsync(Projects.Valid("put-3"));

        var response = await _client.PutAsJsonAsync("/api/projects/put-3", Body("other"));

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
    }

    [Fact]
    public async Task Delete_RemovesTheProject()
    {
        await _factory.Repository.AddAsync(Projects.Valid("delete-1"));

        var deleted = await _client.DeleteAsync("/api/projects/delete-1");
        var gone = await _client.GetAsync("/api/projects/delete-1");

        Assert.Equal(HttpStatusCode.NoContent, deleted.StatusCode);
        Assert.Equal(HttpStatusCode.NotFound, gone.StatusCode);
    }

    [Theory]
    [InlineData("GET")]
    [InlineData("PUT")]
    [InlineData("DELETE")]
    public async Task UnknownProject_AnswersNotFoundWithProblemDetails(string method)
    {
        var request = new HttpRequestMessage(new HttpMethod(method), "/api/projects/missing")
        {
            Content = method == "PUT" ? JsonContent.Create(Body(null)) : null
        };

        var response = await _client.SendAsync(request);

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
        Assert.Equal("application/problem+json", response.Content.Headers.ContentType?.MediaType);
    }

    [Fact]
    public async Task Post_WithATakenId_AnswersConflict()
    {
        await _factory.Repository.AddAsync(Projects.Valid("taken"));

        var response = await _client.PostAsJsonAsync("/api/projects", Body("taken"));

        Assert.Equal(HttpStatusCode.Conflict, response.StatusCode);
    }

    [Fact]
    public async Task Post_WithAnInvalidProject_SaysWhy()
    {
        var response = await _client.PostAsJsonAsync("/api/projects", Body(null));

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        Assert.Equal("application/problem+json", response.Content.Headers.ContentType?.MediaType);
        Assert.Contains("\"detail\":\"id is required.\"", await response.Content.ReadAsStringAsync());
    }

    [Fact]
    public async Task Post_WithAMalformedDate_AnswersBadRequest()
    {
        var response = await _client.PostAsJsonAsync("/api/projects", new { id = "bad-date", start = "not a date" });

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
    }
}
