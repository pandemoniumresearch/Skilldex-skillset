# Skill Anatomy — Full Specification

This document is the authoritative reference for how `SKILL.md` and `SKILLSET.md` files are structured. Load it before authoring or reviewing any skill file.

---

## SKILL.md

Every skill lives in its own directory. The only required file is `SKILL.md`.

### Frontmatter

```yaml
---
name: kebab-case-name           # Required. Matches the directory name exactly.
description: "..."              # Required. One sentence. Starts with a verb. Loaded into tool descriptions — keep it ≤200 chars.
version: "1.0.0"               # Required. Semver.
tags: [tag1, tag2]             # Required. At least one. Lowercase, hyphen-separated.
author: author-handle           # Required. Who wrote it.
---
```

**description rules:**
- Lead with what the skill *does*, not what it *is* ("Writes commit messages…" not "A skill that writes…")
- Must fit in a single sentence
- Avoid hedging words ("tries to", "attempts to", "helps you")
- Do not repeat the name

---

### Body sections

The body is written in Markdown. The sections below are conventions, not enforced schema — but deviating without reason produces inconsistent skills.

#### `## Instructions`

The main prompt body. Written in second person imperative ("load", "ask", "output"). Always present.

Start with a one-line trigger sentence:
```
Use this skill when the user wants to <goal>.
```

#### `### Shared reference` (optional)

If the skill loads a file from the skillset's shared `assets/` directory, declare it here:
```
Before doing anything, load `../assets/filename.md` and apply it strictly.
```

Use `../assets/` for skillset-level shared assets. Use `assets/` for skill-local assets.

#### `### Bundled resources` (optional)

List any local `assets/`, `references/`, or `scripts/` files the skill uses:
```
- `assets/template.md` — output format; use it exactly
- `references/guide.md` — reference loaded into context before writing
- `scripts/helper.sh` — ask the user to run this and share output
```

#### `### Workflow`

Numbered steps describing what the skill does in order. Each step is an action. Keep steps atomic — one thing per step.

#### `### Rules`

Bullet list of invariants — things the skill must always or never do. These are constraints, not steps. Use "Never", "Always", "Only", "Do not".

#### `### Example output` (optional, recommended for simple skills)

A concrete example of what good output looks like. Use a fenced code block.

---

## Complexity tiers

Choose the right tier before starting. The tier determines which supporting directories are needed.

| Tier | Has `assets/` | Has `references/` | Has `scripts/` | When to use |
|------|--------------|-------------------|----------------|-------------|
| Simple | No | No | No | Single output type, no templates, no external data |
| Medium | Yes | No | No | Requires an output template or reusable asset the user never edits |
| Complex | Yes | Yes and/or Yes | Yes | Needs reference docs loaded into context, or asks user to run a script |

**Never create supporting directories you don't use.** An empty `assets/` directory is noise.

---

## Supporting directories

### `assets/`

Skill-local assets. Typically output templates, prompt fragments, or structured data the skill references.

- Name files descriptively: `pr-template.md`, not `template.md`
- Assets are loaded by Claude — keep them concise and machine-readable
- Do not put executable scripts here

### `references/`

Reference documentation loaded into context to inform the skill's output. Not templates — these are background knowledge.

- Use for framework docs, style guides, pattern libraries, taxonomies
- Keep under ~600 lines per file; split if larger
- Reference files are read-only context — the skill reads them, the user does not run them

### `scripts/`

Executable helpers the user runs in their project and pastes output back to Claude.

- Shell scripts (`.sh`) are most portable; include a shebang (`#!/usr/bin/env bash`)
- Always tell the user exactly how to invoke the script in the `## Instructions` body
- Provide a manual fallback command for users who cannot run the script
- Scripts must be safe to run in any project directory without side effects

---

## SKILLSET.md

Every skillset has one `SKILLSET.md` at its root.

### Frontmatter

```yaml
---
name: kebab-case-name           # Required. Matches the directory name.
description: "..."              # Required. 1–2 sentences describing the collection as a whole.
version: "1.0.0"               # Required. Semver. Bump when any skill in the set changes.
tags: [tag1, tag2]             # Required. Union of tags across all skills, plus collection-level tags.
author: author-handle           # Required.
spec_version: "1.0"            # Required. Always "1.0" unless the spec itself is versioned.
---
```

### Body sections

#### `# <Skillset Title>`

Short description paragraph — what the collection is for and who it's for.

#### `## Shared Assets`

List every file in the top-level `assets/` directory and what it does. If there are no shared assets, omit this section.

#### `## Skills`

Bulleted list of every skill in the set. One line each: `**skill-name** — what it does`.

---

## File and directory naming

- All directory names: `kebab-case`
- All file names: `kebab-case.md` (or `.sh` for scripts)
- `SKILL.md` and `SKILLSET.md` are always uppercase — they are manifest files
- Skill directory name must match the `name` field in `SKILL.md` frontmatter exactly
- Skillset directory name must match the `name` field in `SKILLSET.md` frontmatter exactly

---

## What belongs in SKILL.md vs. in an asset file

| Content | Put it in |
|---------|-----------|
| Instructions to Claude | `SKILL.md` body |
| Output template the skill fills in | `assets/template.md` |
| Background knowledge Claude should know | `references/guide.md` |
| A script the user runs | `scripts/helper.sh` |
| Shared convention used by multiple skills | Skillset `assets/` |
| The skill's trigger condition | `SKILL.md` — first line of Instructions |

**Rule of thumb:** If you find yourself writing more than ~80 lines of reference content inline in `SKILL.md`, extract it to `references/`. If you find yourself writing an output template inline, extract it to `assets/`.
