---
name: conventional-commit
description: "Writes well-formed commit messages following the Conventional Commits specification. Infers the commit type and scope from the staged diff and changed file paths, asks for clarification only when the intent is genuinely ambiguous, and formats the result ready to paste into your terminal."
version: "1.0.0"
tags:
  - git
  - commits
  - conventional-commits
  - developer
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to write a commit message for their current staged changes.

### Shared reference

Before writing any commit message, load and internalize `../assets/commit-conventions.md`. This file defines:
- The allowed commit types and when to use each one
- Scope format and examples
- How to handle breaking changes
- The mapping from commit types to changelog sections

Apply this reference strictly — do not invent types that are not in the table.

### Workflow

1. Ask the user to share (or paste) the output of `git diff --staged` if it is not already in context.
2. Examine the diff and changed file paths to infer:
   - **type** — pick the most specific type from the conventions table
   - **scope** — derive from the affected directory or module; omit if cross-cutting
   - **summary** — imperative mood, ≤72 characters, describes what the change does
3. If the diff contains multiple unrelated concerns, say so and ask the user if they want to split the commit or proceed with a combined message.
4. If the intent is unclear (e.g., a large mixed diff with no obvious category), ask one targeted question before writing.
5. Output the commit message in a code block, ready to copy:

```
<type>(<scope>): <summary>
```

If a body or footer is warranted (non-trivial reason, breaking change, issue reference), include it with a blank line separator.

### Rules

- Never fabricate a scope — derive it from the actual paths or omit it
- Never use past tense ("added", "fixed") — use imperative ("add", "fix")
- Never add a period at the end of the summary line
- If a breaking change is present (API removal, flag rename, schema change), always include `BREAKING CHANGE:` in the footer
- Keep the summary ≤72 characters; if it spills over, move detail to the body

### Example output

```
feat(auth): add OAuth2 login flow with GitHub provider
```

```
fix(api): return 404 instead of 500 when user record is missing

Previously the handler crashed on a null lookup result.
Closes #88
```

```
feat(cli)!: rename --output flag to --out

BREAKING CHANGE: The --output flag has been renamed to --out for
consistency with other CLI tools in this suite. Update any scripts
that pass --output.
```
