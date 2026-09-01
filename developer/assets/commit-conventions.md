# Commit Conventions

This document defines the commit message conventions used across this skillset.
Both `conventional-commit` and `changelog-gen` reference this file as their shared source of truth.

---

## Format

```
<type>(<scope>): <short summary>

[optional body]

[optional footer(s)]
```

- **type** — required, lowercase, from the table below
- **scope** — optional, lowercase, describes what area of the codebase changed
- **short summary** — imperative mood, no period at end, ≤72 characters
- **body** — optional, explains *why* not *what*, wrapped at 72 characters
- **footer** — optional, used for breaking changes (`BREAKING CHANGE:`) or issue references (`Closes #123`)

---

## Commit Types

| Type | Use when | Changelog section |
|------|----------|------------------|
| `feat` | Adding a new feature or capability | Added |
| `fix` | Fixing a bug | Fixed |
| `docs` | Documentation changes only | — (omit from changelog) |
| `style` | Formatting, whitespace, no logic change | — (omit from changelog) |
| `refactor` | Code restructure, no feature/fix | Changed |
| `perf` | Performance improvement | Changed |
| `test` | Adding or updating tests | — (omit from changelog) |
| `build` | Build system or dependency changes | — (omit from changelog) |
| `ci` | CI/CD config changes | — (omit from changelog) |
| `chore` | Miscellaneous tasks | — (omit from changelog) |
| `revert` | Reverts a previous commit | Fixed |

The same mapping, declared so `skillpm skillset validate` can hold every member of this skillset
to it. Any member that restates this table and disagrees is a validation error, not a silent drift.

```yaml skilldex-conventions
commit-type-to-changelog-section:
  feat: Added
  fix: Fixed
  revert: Fixed
  refactor: Changed
  perf: Changed
  docs: omit
  style: omit
  test: omit
  build: omit
  ci: omit
  chore: omit
```

---

## Scope Examples

Scopes should match the area of the codebase affected:

- `auth`, `api`, `db`, `ui`, `cli`, `core`, `config`, `deps`
- Use the directory name or module name when obvious
- Omit scope if the change is truly cross-cutting

---

## Breaking Changes

Append `!` after the type/scope and add a `BREAKING CHANGE:` footer:

```
feat(api)!: remove deprecated /v1 endpoints

BREAKING CHANGE: The /v1 endpoints have been removed. Use /v2 instead.
```

Breaking changes always appear at the top of the changelog under a **Breaking Changes** section.

---

## Examples

```
feat(auth): add OAuth2 login with GitHub

fix(api): handle null response when user not found

docs: update README with new install instructions

refactor(core): extract validation logic into separate module

feat(cli)!: rename --output flag to --out

BREAKING CHANGE: The --output flag has been renamed to --out for consistency.
Closes #42
```
