---
name: skill-author
description: "Guides you through designing and writing a new Claude skill from scratch — determines the right complexity tier, writes the SKILL.md with correct frontmatter and instructions, and scaffolds any supporting assets, references, or scripts the skill needs."
version: "1.0.0"
tags: [meta, skill-authoring, developer, tooling]
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to create a new Claude skill.

### Shared reference

Before doing anything, load `../assets/skill-anatomy.md` and internalize it completely. Every decision you make — frontmatter fields, section names, which directories to create — must conform to that spec. Do not invent fields or conventions that are not in it.

### Bundled resources

- `assets/simple-template.md` — starter template for a simple skill (no supporting dirs)
- `assets/medium-template.md` — starter template for a medium skill (with `assets/`)
- `assets/complex-template.md` — starter template for a complex skill (with `assets/`, `references/`, `scripts/`)
- `references/complexity-guide.md` — decision guide for choosing the right complexity tier; load this during Step 2

### Workflow

1. **Understand the goal.** Ask the user:
   - What task or workflow does this skill handle?
   - What does the user type or say to trigger it?
   - What should the output look like? (e.g., a filled template, a code block, a structured report)
   - Will Claude need any external data the user has to provide (file contents, command output, URLs)?

   If the user has already described the skill in enough detail, skip questions you can answer yourself. Never ask for information you already have.

2. **Choose the complexity tier.** Load `references/complexity-guide.md` and apply it to what you learned in Step 1. State your choice and your reasoning in one sentence before continuing. If the user disagrees, discuss and adjust.

3. **Draft the frontmatter.** Fill in all required fields:
   - `name` — derive from the skill's purpose; kebab-case; must match the intended directory name
   - `description` — one sentence starting with a verb; ≤200 chars; loaded as a tool description so make it precise
   - `version` — always `"1.0.0"` for new skills
   - `tags` — at least one; lowercase; hyphen-separated
   - `author` — ask if not provided

4. **Write the Instructions body.** Follow the section structure from `skill-anatomy.md`:
   - Open with the trigger sentence
   - If the skill loads shared skillset assets, add a `### Shared reference` section
   - If the skill uses local assets/references/scripts, add a `### Bundled resources` section
   - Write a numbered `### Workflow` covering every step the skill takes
   - Write a `### Rules` section with hard invariants
   - If the skill is simple, include a `### Example output` section

5. **Scaffold supporting files.** Based on the chosen tier:
   - **Simple**: no additional files needed
   - **Medium**: design the `assets/` file(s) — write out their full contents, not just a description
   - **Complex**: design `assets/` and `references/` files; write a stub `scripts/` shell script if a script is needed, with the correct shebang and a comment block explaining what it does

6. **Present the complete skill package.** Output:
   - The full `SKILL.md` in a fenced code block labeled with the file path
   - Any supporting files, each in their own fenced code block labeled with their path
   - A directory tree showing the final layout

   Then ask: "Does this match what you had in mind, or do you want to adjust anything?"

### Rules

- Never create supporting directories (`assets/`, `references/`, `scripts/`) unless the skill actually uses them
- Never invent frontmatter fields not defined in `skill-anatomy.md`
- Never write a description in passive voice or starting with "A skill that…"
- The `name` field in frontmatter must be identical to the directory name — flag it if the user proposes a mismatch
- Never pad the `Workflow` with steps that just say "review the output" or "make sure it's correct" — every step must be a concrete action
- If a workflow step needs reference content that would exceed ~80 lines inline, extract it to `references/`
- If a workflow step outputs from a template, extract the template to `assets/`
- Always write the complete file contents — never output placeholder comments like `<!-- fill in here -->`
