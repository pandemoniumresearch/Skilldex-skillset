---
name: skillset-author
description: "Guides you through designing and packaging a complete skillset — determines what skills belong together, writes the SKILLSET.md manifest, identifies shared assets, and produces the full directory layout with all skill files ready to install."
version: "1.0.0"
tags:
  - meta
  - skillset-authoring
  - developer
  - tooling
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to create a new skillset — a named, installable collection of related Claude skills.

### Shared reference

Before doing anything, load `../assets/skill-anatomy.md` and internalize it. Every decision about frontmatter, directory structure, and naming conventions must conform to that spec.

### Bundled resources

- `assets/skillset-template.md` — the output template for `SKILLSET.md`; load and use it exactly

### Workflow

1. **Understand the collection.** Ask the user:
   - What is the common theme or domain? (e.g., developer workflows, research tasks, writing, data analysis)
   - What skills does the user have in mind? List them out; for each, ask for a one-line description of what it does.
   - Who is the intended user of this skillset?

   If the user has already described this in enough detail, skip questions you can answer. Never ask for information you already have.

2. **Validate the skill list.** For each proposed skill, check:
   - Is it distinct enough from the others to be its own skill, or should it be merged?
   - Is it in scope for the stated theme? Flag anything that seems out of place and ask if it belongs.
   - Is the name clear and action-oriented? Suggest a better kebab-case name if not.

   A good skillset has 2–6 skills. If the user proposes more than 6, ask whether some are stretch goals that could come later.

3. **Identify shared assets.** Look across the skills for common data, conventions, or references that multiple skills will need:
   - A shared taxonomy or type system (e.g., commit types used by both a commit-writer and a changelog-generator)
   - A shared audience or persona definition used by multiple explainer-type skills
   - A shared output convention referenced by 3+ skills

   If you find a genuine shared asset, note it and its proposed filename. If there are no shared assets, say so — do not invent one.

4. **Choose the complexity tier for each skill.** Apply the complexity tier logic from `skill-anatomy.md` to each skill. Note which skills will need `assets/`, `references/`, or `scripts/` directories.

5. **Draft the SKILLSET.md.** Load `assets/skillset-template.md` and fill it in:
   - `name` — kebab-case; must match the intended directory name
   - `description` — 1–2 sentences describing the collection as a whole
   - `version` — `"1.0.0"` for new skillsets
   - `tags` — union of all skill tags, plus collection-level tags
   - Body: title paragraph, Shared Assets section (if any), Skills section

6. **Design each skill.** For each skill in the set, produce a full `SKILL.md` using the same workflow as the `skill-author` skill:
   - Write all frontmatter fields
   - Write the full Instructions body (trigger sentence, sections, workflow, rules)
   - Design and write out supporting files (`assets/`, `references/`, `scripts/`) as needed

7. **Present the complete package.** Output:
   - A directory tree of the entire skillset
   - `SKILLSET.md` in a fenced code block labeled with its path
   - Each `SKILL.md` and supporting file in labeled fenced code blocks, grouped by skill
   - Any shared `assets/` files at the skillset level

   Then ask: "Does this structure match what you had in mind? Are there any skills to add, remove, or rename?"

### Rules

- Never create a skillset with only one skill — a single skill doesn't need a skillset wrapper; point the user toward `skill-author` instead
- Never create shared assets that are only used by one skill — those belong in the skill's own `assets/` directory
- Never invent frontmatter fields not defined in `skill-anatomy.md`
- The `name` in each `SKILL.md` must exactly match its directory name; flag any mismatch
- The `name` in `SKILLSET.md` must exactly match the skillset directory name
- Always write complete file contents — never output placeholder comments like `<!-- fill in here -->`
- If a skill in the set is complex enough to benefit from a script, write a real script stub with the correct shebang and a comment block — not a placeholder
- Do not duplicate content between `SKILLSET.md` and individual `SKILL.md` files — the manifest describes the collection; the skill files describe individual behavior
