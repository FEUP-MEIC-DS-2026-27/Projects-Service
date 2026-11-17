using Microsoft.AspNetCore.Mvc;
using ProjectsService.Api.Models.Request.Projects;
using ProjectsService.Api.Models.Response.Projects;
using ProjectsService.Application;
using ProjectsService.Application.Interfaces;

namespace ProjectsService.Api.Controllers;

[ApiController]
[Route("api/projects")]
public class ProjectsController : ControllerBase
{
    private readonly IProjectApplicationService _projects;

    public ProjectsController(IProjectApplicationService projects)
    {
        _projects = projects;
    }

    /// <summary>Every project, ordered by start date.</summary>
    [HttpGet]
    [ProducesResponseType(typeof(IReadOnlyList<ProjectResponse>), StatusCodes.Status200OK)]
    public async Task<ActionResult<IReadOnlyList<ProjectResponse>>> List(CancellationToken cancellationToken)
    {
        var projects = await _projects.ListAsync(cancellationToken);
        return Ok(projects.Select(ProjectResponse.FromDomain).ToList());
    }

    /// <param name="id">The project code.</param>
    /// <param name="cancellationToken"></param>
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(ProjectResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status404NotFound)]
    public async Task<ActionResult<ProjectResponse>> Get(string id, CancellationToken cancellationToken)
    {
        try
        {
            return Ok(ProjectResponse.FromDomain(await _projects.GetAsync(id, cancellationToken)));
        }
        catch (ProjectNotFoundException ex)
        {
            return Problem(detail: ex.Message, statusCode: StatusCodes.Status404NotFound);
        }
    }

    /// <summary>Creates a project. The body's id is the project code.</summary>
    [HttpPost]
    [ProducesResponseType(typeof(ProjectResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status409Conflict)]
    public async Task<ActionResult<ProjectResponse>> Create(ProjectRequest request, CancellationToken cancellationToken)
    {
        try
        {
            var project = await _projects.CreateAsync(request.Id, request.ToDto(), cancellationToken);
            return CreatedAtAction(nameof(Get), new { id = project.Id }, ProjectResponse.FromDomain(project));
        }
        catch (InvalidProjectException ex)
        {
            return Problem(detail: ex.Message, statusCode: StatusCodes.Status400BadRequest);
        }
        catch (ProjectAlreadyExistsException ex)
        {
            return Problem(detail: ex.Message, statusCode: StatusCodes.Status409Conflict);
        }
    }

    /// <summary>Replaces every field but the id.</summary>
    /// <param name="id">The project code.</param>
    /// <param name="request"></param>
    /// <param name="cancellationToken"></param>
    [HttpPut("{id}")]
    [ProducesResponseType(typeof(ProjectResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status404NotFound)]
    public async Task<ActionResult<ProjectResponse>> Update(string id, ProjectRequest request, CancellationToken cancellationToken)
    {
        if (request.Id is not null && request.Id.Trim() != id)
            return Problem(
                detail: "id cannot change. Leave it out of the body or repeat the one in the URL.",
                statusCode: StatusCodes.Status400BadRequest);

        try
        {
            return Ok(ProjectResponse.FromDomain(await _projects.UpdateAsync(id, request.ToDto(), cancellationToken)));
        }
        catch (InvalidProjectException ex)
        {
            return Problem(detail: ex.Message, statusCode: StatusCodes.Status400BadRequest);
        }
        catch (ProjectNotFoundException ex)
        {
            return Problem(detail: ex.Message, statusCode: StatusCodes.Status404NotFound);
        }
    }

    /// <param name="id">The project code.</param>
    /// <param name="cancellationToken"></param>
    [HttpDelete("{id}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Delete(string id, CancellationToken cancellationToken)
    {
        try
        {
            await _projects.DeleteAsync(id, cancellationToken);
            return NoContent();
        }
        catch (ProjectNotFoundException ex)
        {
            return Problem(detail: ex.Message, statusCode: StatusCodes.Status404NotFound);
        }
    }
}
