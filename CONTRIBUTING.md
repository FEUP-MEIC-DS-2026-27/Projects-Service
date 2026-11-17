# Contributing

## Branches

Branch from `main` and name the branch `<type>/<short-description>`, for example `feat/search-endpoint` or `fix/empty-query-paging`. Never push to `main` directly.

## Commits

```
<type>: <subject>
```

- Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`.
- Imperative, lowercase, no period, 50 characters at most: `feat: add search endpoint`, not `Added search endpoint.`
- Add a body only when the reason for the change isn't obvious.
- Everything in English: code, comments, docs, commits.

## Pull requests

- One feature or fix per PR. Keep it small enough to review in one sitting.
- The title follows the commit format. PRs are squash-merged, so the title becomes the commit on `main`.
- The description says what changed and why, how to run and test it, and what is not done yet.
- Before opening it, check that:
  - `dotnet test` passes in `projects-service`. Warnings fail the build.
  - `docker compose up --build` in `deploy/` still starts and the change works at http://localhost:8010.
- Another team member reviews and approves before merging. The author doesn't merge their own PR.
- Merge with **Squash and merge**, then delete the branch.

## Database and API

- Change the schema with a new Flyway migration in `projects-service/database/schema/` (for example `V2__add_partners.sql`). Never edit a migration that is already on `main`.
- The API is a contract with h.i's VA3 page and the Search Service. Adding a field is fine. Removing or changing one needs a new version (`/api/v2/projects`). Either way, update the [wiki page](https://github.com/FEUP-MEIC-DS-2026-27/h.i/wiki/Projects,-Grants-and-Events-API).
- Never commit secrets, connection strings with passwords, or `.env` files.

## Repository rules

A ruleset on GitHub protects `main`, the same as Search-Service's. Changes go through a pull request with one approval and resolved threads. The three CI checks must pass on a branch that is up to date with `main`. History stays linear, and `main` can't be deleted or force-pushed.

If you rename a job in `.github/workflows/projects-service.yml`, update the required checks in the ruleset settings too.
