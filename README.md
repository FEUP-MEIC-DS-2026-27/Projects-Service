# HumanISE: projects

As a coordinator, I want to create, update and remove projects, so that the platform always shows the current portfolio.

Our value area in humanISE.info is VA3, Projects, Partners, Grants, Events, Software, Supervisions, etc. (1MEIC02 + 1MEIC04).

This repository holds `projects-service`, the only place that writes projects, and publishes it as Docker images. It follows [Projects, Grants and Events API](https://github.com/FEUP-MEIC-DS-2026-27/h.i/wiki/Projects,-Grants-and-Events-API), with its own database and a REST API under `/api/projects`. The Search Service reads it. It doesn't publish to Kafka.

| Folder | |
| --- | --- |
| `projects-service/` | The API and its Dockerfiles. See its [README](projects-service/README.md). |
| `deploy/` | Compose files that run the images like h.i does |

## Run

Needs Docker.

```sh
cd deploy
docker compose up --build -d                  # build from this checkout
docker compose pull && docker compose up -d   # or use the published images
```

The API is on http://localhost:8010, with Swagger UI at http://localhost:8010/swagger. The database has the same 75 mock projects as the Search Service.

```sh
curl http://localhost:8010/api/projects/INE-25-0013
```

`docker compose down -v` stops everything and deletes the data.

## Test

Needs the .NET 10 SDK.

```sh
cd projects-service
dotnet test
```

On Windows, Smart App Control may block the build ("An Application Control policy blocked this file"). Run the tests in a container instead:

```sh
docker run --rm -v "${PWD}:/repo" -w /repo/projects-service mcr.microsoft.com/dotnet/sdk:10.0 dotnet test
```

## Images

| Image | Built from | |
| --- | --- | --- |
| `ghcr.io/feup-meic-ds-2026-27/projects-service` | `projects-service/Dockerfile` | The API, on port 8080 |
| `ghcr.io/feup-meic-ds-2026-27/projects-migrations` | `projects-service/DockerfileFlyway` | Creates the tables, plus the mock data in `deploy/compose.yaml`, then exits |

`.github/workflows/projects-service.yml` runs the tests, then builds both images for amd64 and arm64. Pushes to `main` publish `latest` and `sha-<commit>`. `v*` tags publish their version. Pull requests only build.

If the repository is private, so are the packages. After the first publish, make each one Public in its package settings, or h.i will need `docker login ghcr.io`.

### Releases

Tag `main` with `vMAJOR.MINOR.PATCH`. Bump MAJOR when h.i or the Search Service has to change too, MINOR for anything they can take as is, PATCH for fixes.

```sh
git switch main && git pull
git tag v1.0.0
git push origin v1.0.0
```

The run on the tag tests and publishes `:v1.0.0`. In h.i, set `PROJECTS_IMAGE_TAG=v1.0.0` to use it. Never reuse a tag. Fix a release with a new one.

### Adding it to h.i

1. In `compose.yaml`, add the services in `deploy/compose.yaml`, without the `build` sections. Port 8010 is free there.
2. Add the services in `deploy/compose.prod.yaml` to `compose.prod.yaml`, and the Caddy block from its header to `deploy/Caddyfile.prod`. Publish port 8010 on Caddy. Production loads no mock data.
3. Add `PROJECTS_DB_PASSWORD=` to `.env.example`. Set `PROJECTS_IMAGE_TAG` there too to pin a release.
4. Route `/api/projects` to `projects-service:8080` in the API Gateway.
5. Give search-service `PROJECTS_API_URL: http://projects-service:8080`. Search reads every project from here when it starts.

## Status

Not done yet:

- Search reads the projects only when it starts, so changes reach search after its next restart. Kafka events from `Service "Post Events"` should fix that.
- `funding` is not in the wiki's Project shape yet.
- Projects are mock data.
