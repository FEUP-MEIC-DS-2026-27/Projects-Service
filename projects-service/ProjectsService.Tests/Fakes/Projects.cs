using ProjectsService.Application.DTOs;
using ProjectsService.Domain;

namespace ProjectsService.Tests.Fakes;

public static class Projects
{
    public static ProjectDataDto ValidData { get; } = new()
    {
        Title = "Solar Power Installation - Hamburg #13",
        Description = "Rooftop panels",
        Status = "Active",
        Priority = "High",
        ProjectType = "Energy",
        Client = "Atlantic Energy Solutions",
        Department = "Engineering",
        Manager = "Matilde Ribeiro",
        Start = new DateOnly(2025, 3, 1),
        End = new DateOnly(2026, 2, 28),
        Funding = 125000.50m
    };

    public static Project Valid(string id) => new()
    {
        Id = id,
        Title = ValidData.Title!,
        Description = ValidData.Description!,
        Status = ValidData.Status!,
        Priority = ValidData.Priority!,
        ProjectType = ValidData.ProjectType!,
        Client = ValidData.Client!,
        Department = ValidData.Department!,
        Manager = ValidData.Manager!,
        Start = ValidData.Start!.Value,
        End = ValidData.End!.Value,
        Funding = ValidData.Funding
    };
}
