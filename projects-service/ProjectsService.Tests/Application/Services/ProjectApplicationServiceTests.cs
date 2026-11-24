using ProjectsService.Application;
using ProjectsService.Application.Services;
using ProjectsService.Tests.Fakes;

namespace ProjectsService.Tests.Application.Services;

public class ProjectApplicationServiceTests
{
    private readonly InMemoryProjectRepository _repository = new();
    private readonly ProjectApplicationService _service;

    public ProjectApplicationServiceTests()
    {
        _service = new ProjectApplicationService(_repository);
    }

    [Fact]
    public async Task CreateAsync_StoresTheTrimmedProject()
    {
        var created = await _service.CreateAsync(" INE-25-0013 ", Projects.ValidData with { Title = "  Solar  " });

        Assert.Equal("INE-25-0013", created.Id);
        Assert.Equal("Solar", created.Title);
        Assert.Equal(created, await _repository.GetAsync("INE-25-0013"));
    }

    [Fact]
    public async Task CreateAsync_WithoutDescription_StoresAnEmptyOne()
    {
        var created = await _service.CreateAsync("p-1", Projects.ValidData with { Description = null });

        Assert.Equal("", created.Description);
    }

    [Fact]
    public async Task CreateAsync_WithATakenId_Throws()
    {
        await _service.CreateAsync("p-1", Projects.ValidData);

        await Assert.ThrowsAsync<ProjectAlreadyExistsException>(() => _service.CreateAsync("p-1", Projects.ValidData));
    }

    [Theory]
    [InlineData(null)]
    [InlineData(" ")]
    [InlineData("-starts-with-dash")]
    [InlineData("has space")]
    [InlineData("has/slash")]
    [InlineData("1234567890123456789012345678901")]
    public async Task CreateAsync_WithABadId_Throws(string? id)
    {
        await Assert.ThrowsAsync<InvalidProjectException>(() => _service.CreateAsync(id, Projects.ValidData));
    }

    public static TheoryData<string> MissingFields => ["title", "status", "priority", "projectType", "client", "department", "manager", "start", "end"];

    [Theory]
    [MemberData(nameof(MissingFields))]
    public async Task CreateAsync_WithoutARequiredField_SaysWhichOne(string field)
    {
        var data = field switch
        {
            "title" => Projects.ValidData with { Title = "" },
            "status" => Projects.ValidData with { Status = null },
            "priority" => Projects.ValidData with { Priority = null },
            "projectType" => Projects.ValidData with { ProjectType = " " },
            "client" => Projects.ValidData with { Client = null },
            "department" => Projects.ValidData with { Department = null },
            "manager" => Projects.ValidData with { Manager = null },
            "start" => Projects.ValidData with { Start = null },
            _ => Projects.ValidData with { End = null }
        };

        var ex = await Assert.ThrowsAsync<InvalidProjectException>(() => _service.CreateAsync("p-1", data));

        Assert.Equal($"{field} is required.", ex.Message);
    }

    [Fact]
    public async Task CreateAsync_WithAnUnknownStatus_ListsTheValidOnes()
    {
        var ex = await Assert.ThrowsAsync<InvalidProjectException>(
            () => _service.CreateAsync("p-1", Projects.ValidData with { Status = "active" }));

        Assert.Equal("Unknown status 'active'. Use Planned, Active, On Hold, Completed, Cancelled.", ex.Message);
    }

    [Fact]
    public async Task CreateAsync_WithAnUnknownPriority_Throws()
    {
        await Assert.ThrowsAsync<InvalidProjectException>(
            () => _service.CreateAsync("p-1", Projects.ValidData with { Priority = "Urgent" }));
    }

    [Fact]
    public async Task CreateAsync_WithEndBeforeStart_Throws()
    {
        var data = Projects.ValidData with { Start = new DateOnly(2026, 1, 2), End = new DateOnly(2026, 1, 1) };

        var ex = await Assert.ThrowsAsync<InvalidProjectException>(() => _service.CreateAsync("p-1", data));

        Assert.Equal("end cannot be before start.", ex.Message);
    }

    [Fact]
    public async Task CreateAsync_WithNegativeFunding_Throws()
    {
        await Assert.ThrowsAsync<InvalidProjectException>(
            () => _service.CreateAsync("p-1", Projects.ValidData with { Funding = -1 }));
    }

    [Fact]
    public async Task CreateAsync_WithoutFunding_IsValid()
    {
        var created = await _service.CreateAsync("p-1", Projects.ValidData with { Funding = null });

        Assert.Null(created.Funding);
    }

    [Fact]
    public async Task CreateAsync_WithResearcherIds_DeduplicatesAndOrdersThem()
    {
        var created = await _service.CreateAsync(
            "p-1",
            Projects.ValidData with { ResearcherIds = [3, 1, 3, 2] });

        Assert.Equal([1, 2, 3], created.ResearcherIds);
    }

    [Fact]
    public async Task CreateAsync_WithInvalidResearcherId_Throws()
    {
        await Assert.ThrowsAsync<InvalidProjectException>(() =>
            _service.CreateAsync("p-1", Projects.ValidData with { ResearcherIds = [0] }));
    }

    [Fact]
    public async Task CreateAsync_EndingTheDayItStarts_IsValid()
    {
        var day = new DateOnly(2026, 1, 1);

        var created = await _service.CreateAsync("p-1", Projects.ValidData with { Start = day, End = day });

        Assert.Equal(day, created.End);
    }

    [Fact]
    public async Task CreateAsync_WithATooLongTitle_Throws()
    {
        var data = Projects.ValidData with { Title = new string('x', ProjectApplicationService.MaxTitleLength + 1) };

        await Assert.ThrowsAsync<InvalidProjectException>(() => _service.CreateAsync("p-1", data));
    }

    [Fact]
    public async Task UpdateAsync_ReplacesTheFields()
    {
        await _service.CreateAsync("p-1", Projects.ValidData);

        var updated = await _service.UpdateAsync("p-1", Projects.ValidData with { Status = "On Hold" });

        Assert.Equal("On Hold", updated.Status);
        Assert.Equal("On Hold", (await _service.GetAsync("p-1")).Status);
    }

    [Fact]
    public async Task UpdateAsync_WithAnUnknownId_Throws()
    {
        await Assert.ThrowsAsync<ProjectNotFoundException>(() => _service.UpdateAsync("missing", Projects.ValidData));
    }

    [Fact]
    public async Task GetAsync_WithAnUnknownId_Throws()
    {
        await Assert.ThrowsAsync<ProjectNotFoundException>(() => _service.GetAsync("missing"));
    }

    [Fact]
    public async Task DeleteAsync_RemovesTheProject()
    {
        await _service.CreateAsync("p-1", Projects.ValidData);

        await _service.DeleteAsync("p-1");

        await Assert.ThrowsAsync<ProjectNotFoundException>(() => _service.GetAsync("p-1"));
        await Assert.ThrowsAsync<ProjectNotFoundException>(() => _service.DeleteAsync("p-1"));
    }

    [Fact]
    public async Task ListAsync_OrdersByStartDate()
    {
        await _service.CreateAsync("late", Projects.ValidData with { Start = new DateOnly(2025, 6, 1) });
        await _service.CreateAsync("early", Projects.ValidData with { Start = new DateOnly(2025, 1, 1) });

        Assert.Equal(["early", "late"], (await _service.ListAsync()).Select(p => p.Id));
    }
}
