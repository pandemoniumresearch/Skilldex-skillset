---
name: changelog-gen
description: "Produces CHANGELOG entries from git history following the Keep a Changelog format. Uses a bundled script to extract commits since the last tag, classifies them into changelog sections using the shared commit conventions reference, and outputs a ready-to-paste release block."
version: "1.0.0"
tags: [git, changelog, releases, developer, workflow]
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to generate a CHANGELOG entry for an upcoming release.

### Shared reference

Load `../assets/commit-conventions.md` before classifying any commits. This file defines the mapping from commit types to changelog sections:

| Commit type | Changelog section |
|-------------|------------------|
| `feat` | Added |
| `fix`, `revert` | Fixed |
| `refactor`, `perf` | Changed |
| `docs`, `style`, `test`, `build`, `ci`, `chore` | Omit |
| Breaking change (`!` or `BREAKING CHANGE:` footer) | Breaking Changes (always first) |

### Bundled script

`scripts/parse-git-log.sh` extracts structured commit data since the last git tag.

Ask the user to run it in their project root and share the output:

```bash
bash path/to/changelog-gen/scripts/parse-git-log.sh
```

If the user cannot run the script (e.g., Windows without bash), ask them to share the output of:

```bash
git log $(git describe --tags --abbrev=0)..HEAD --pretty=format:"%H|%s|%b---END---"
```

### Template

Load `assets/changelog-template.md` for the output format. Use it exactly — do not invent a different structure.

### Workflow

1. Get the commit list (via script output or manual git log).
2. Get the release version number from the user (e.g., `1.4.0`).
3. Load the commit conventions and classify each commit into its changelog section.
4. Omit commits with types that map to "Omit" in the table above.
5. Within each section, sort entries with breaking changes first, then by significance.
6. Deduplicate — if multiple commits address the same thing, merge into one entry.
7. Fill in the template with today's date and the version, then output the result.

### Rules

- Only include commits that map to a changelog section — never pad with chore/docs/test commits
- Write entries in plain language from a user perspective, not as internal implementation notes
- Breaking changes must always appear in a dedicated **Breaking Changes** section at the top
- If the commit log is empty or only contains omitted types, tell the user and ask if they want to write a manual entry
