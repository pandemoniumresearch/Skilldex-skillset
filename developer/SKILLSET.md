---
name: developer
description: "A collection of Claude skills for everyday developer workflows. Covers commit message writing, pull request description generation, changelog production from git history, and test writing that matches a project's existing patterns and conventions."
version: "1.0.0"
tags: [developer, git, testing, workflow, productivity]
author: skilldex-examples
spec_version: "1.0"
---

# Developer Workflow Skillset

Skills for common developer tasks — from writing a commit message to generating a full changelog.

## Shared Assets

The `assets/` directory at the root of this skillset contains resources shared across multiple skills:

- `assets/commit-conventions.md` — defines commit types, scope format, and examples. Used by both `conventional-commit` (when writing messages) and `changelog-gen` (when classifying commits into changelog categories).

## Skills

- **conventional-commit** — writes well-formed commit messages following the Conventional Commits spec
- **pr-description** — generates structured PR descriptions from diff context and branch name
- **changelog-gen** — produces CHANGELOG entries from git log using a bundled parsing script
- **test-writer** — detects your test framework and writes tests that match existing project patterns
