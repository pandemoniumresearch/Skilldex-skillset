# Skilldex Example Skillsets

Example skillsets for [Skilldex](https://github.com/your-org/Skilldex) — a package manager for Claude skills.

This repo demonstrates how to structure a skillset, from simple single-file skills to complex ones with bundled scripts, references, and templates.

## Skillsets

### `developer/` — Developer Workflow
Claude skills for everyday coding tasks.

| Skill | What it does | Complexity |
|-------|-------------|-----------|
| `conventional-commit` | Writes Conventional Commits-compliant commit messages | Simple |
| `pr-description` | Generates structured PR descriptions from diff context | Medium |
| `changelog-gen` | Produces CHANGELOG entries from git history | Complex |
| `test-writer` | Writes tests matching your project's existing patterns | Complex |

### `research/` — Research & Synthesis
Claude skills for analysis and synthesis tasks.

| Skill | What it does | Complexity |
|-------|-------------|-----------|
| `technical-explainer` | Explains technical topics calibrated to audience level | Simple |
| `paper-summarizer` | Produces structured summaries of academic/technical papers | Medium |
| `competitive-analysis` | Generates structured competitor breakdowns | Complex |

## Structure

Each skillset follows this layout:

```
skillset-name/
├── SKILLSET.md          # Skillset manifest — frontmatter + description
├── assets/              # Shared assets used by multiple skills in this set
├── skill-name/
│   ├── SKILL.md         # Skill instructions
│   ├── assets/          # Templates used by this skill
│   ├── references/      # Reference docs loaded into context
│   └── scripts/         # Executable helpers
└── ...
```

## Installation

```bash
# Install a single skill
skillpm install ./developer/conventional-commit

# Validate a skillset
skillpm validate ./developer
```
