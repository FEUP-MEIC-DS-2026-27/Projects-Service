# projects-service

```
ProjectsService.Api/              controller, requests, responses, health checks, CORS
ProjectsService.Application/      project service, validation, interfaces, DTOs
ProjectsService.Domain/           Project, ProjectStatuses, ProjectPriorities
ProjectsService.Infrastructure/   ProjectRepository (Postgres)
ProjectsService.Tests/
database/                         Flyway migrations
```

Swagger UI is at `/swagger`. Health checks are `/health/live` and `/health/ready`.

## API

| Request | Response |
| --- | --- |
| `GET /api/projects` | `200`, every project ordered by `start` |
| `GET /api/projects/{id}` | `200`; `404` |
| `POST /api/projects` | `201` with a `Location` header; `400`; `409` when the id is taken |
| `PUT /api/projects/{id}` | `200`; `400`; `404` |
| `DELETE /api/projects/{id}` | `204`; `404` |

```json
{
  "id": "INE-25-0013",
  "title": "Solar Power Installation - Hamburg #13",
  "description": "...",
  "status": "Active",
  "priority": "High",
  "projectType": "Energy",
  "client": "Atlantic Energy Solutions",
  "department": "Engineering",
  "manager": "Matilde Ribeiro",
  "start": "2025-03-01",
  "end": "2026-02-28",
  "funding": 125000.50,
  "researcherIds": [1, 2, 5, 13],
  "updatedAt": "2026-09-18T12:00:00Z"
}
```

- `id` is the project code. It has up to 30 letters, digits, `.`, `_` and `-`. `POST` requires it. `PUT` takes it from the URL, and the body may leave it out or repeat it.
- Every field but `description` and `funding` is required. `end` cannot be before `start`.
- `funding` is the approved funding in euros, not negative. It is not in the wiki's shape yet. The Search Service needs it for its funding filters.
- `updatedAt` is when the project last changed, in UTC. The service sets it and ignores it in request bodies. Search sorts by it.
- `status` is one of `Planned`, `Active`, `On Hold`, `Completed` or `Cancelled`.
- `priority` is one of `Low`, `Medium`, `High` or `Critical`.
- `grantIds` is a response-only array of grant IDs associated with the project, ordered numerically. It is empty when there are no associations.
- Creating or updating a project does not assign or remove grants. Updating project fields preserves existing associations.
- Deleting a project also deletes its rows in `project_grants`.

Errors answer with a `detail` you can show to users:

```json
{ "status": 400, "title": "Bad Request", "detail": "end cannot be before start." }
```

## Configuration

| Key | |
| --- | --- |
| `ConnectionStrings__ProjectsDb` | Postgres |
| `CORS_ORIGINS` | Comma-separated browser origins, such as the shell and VA3 |

## Database

`database/schema/` creates the `projects` table. `database/mock/` loads the 75 mock projects the Search Service has, flattened to the API's shape. The migrations image runs only the schema. `deploy/compose.yaml` adds the mock data with:

```yaml
FLYWAY_LOCATIONS: filesystem:/flyway/sql,filesystem:/flyway/mock
```

Schema changes go in a new migration in `database/schema/` (`V2__add_partners.sql`). The mock data is version 1.1, so it runs right after the tables.

## Tests

The Postgres tests run only when `PROJECTS_TEST_DB` is set. They read the mock data, and delete the projects they create.

```sh
docker run -d --rm --name projects-test-pg -e POSTGRES_PASSWORD=pw -p 55433:5432 postgres:17
docker exec -i -e PGPASSWORD=pw projects-test-pg psql -U postgres -h localhost < database/schema/V1__create_tables.sql
docker exec -i -e PGPASSWORD=pw projects-test-pg psql -U postgres -h localhost < database/mock/V1_1__load_mock_data.sql
PROJECTS_TEST_DB="Host=localhost;Port=55433;Username=postgres;Password=pw" dotnet test
docker stop projects-test-pg
```
