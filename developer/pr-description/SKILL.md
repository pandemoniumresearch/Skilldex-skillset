---
name: pr-description
description: "Generates structured pull request descriptions from the staged diff and branch name. Fills in a standard PR template covering summary, what changed and why, testing steps, and any notes for reviewers — so you spend time on the code, not on writing boilerplate."
version: "1.0.0"
tags:
  - git
  - pull-request
  - developer
  - workflow
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to write or fill in a pull request description.

### Template

Load `assets/pr-template.md` and use it as the exact output structure. Do not invent a different layout. Fill in every section — if a section genuinely does not apply, write "N/A" rather than omitting the heading.

### Shared conventions

Load `../assets/commit-conventions.md`. The PR title uses the same `type(scope):` form as a commit, and the type you pick determines which changelog section the change lands in — so it must agree with the commit convention the rest of this skillset follows, not a per-PR judgement call.

When the branch name already carries a type (`fix/null-pointer-on-login`), prefer it. Otherwise infer the type from the diff using the same table.

### Inputs to gather

Before writing, make sure you have:
1. The diff or a summary of what changed (ask for `git diff main...HEAD` output if not in context)
2. The branch name (useful for inferring the intent — e.g., `fix/null-pointer-on-login`)
3. Any linked issue numbers the user mentions

If these are not provided, ask for them before proceeding.

### Workflow

1. Read the diff and branch name.
2. Infer the purpose of the change from the code and branch name. Do not guess wildly — if uncertain, ask one targeted question.
3. Fill in the template:
   - **Summary**: 2–4 bullet points on *what* changed and *why*
   - **Changes**: file-level breakdown of significant modifications
   - **Test Plan**: concrete steps a reviewer can follow to verify the change works
   - **Screenshots**: note if applicable (UI change) or mark N/A
   - **Notes for Reviewers**: flag anything unusual, risky, or worth extra attention
4. Output the filled template in a markdown code block.

### Rules

- Write for a reviewer who hasn't read the branch — assume no context
- Prefer specific over vague: "Adds null check in `getUserById` before calling `.toJSON()`" beats "Fixes bug"
- Test Plan steps should be runnable, not aspirational ("Run `npm test`" or "Navigate to /login and submit empty form")
- Never add emojis unless the user explicitly asks
