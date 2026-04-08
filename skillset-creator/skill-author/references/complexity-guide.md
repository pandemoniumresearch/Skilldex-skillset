# Skill Complexity Guide

Use this guide to determine the right complexity tier for a skill before writing it. Read through each tier's criteria and pick the lowest tier that covers all the skill's needs — simpler is always better.

---

## Tier 1: Simple

**Choose Simple when all of the following are true:**
- The skill produces a single, consistent output type (a code block, a short document, a list)
- The output format can be described inline in the instructions in under 20 lines
- Claude does not need to load any template, reference doc, or run a script
- The user does not need to provide structured external data beyond what they can describe in conversation

**Resulting directory layout:**
```
skill-name/
└── SKILL.md
```

**Examples of Simple skills:**
- A skill that writes a commit message from a pasted diff
- A skill that rewrites a paragraph in a different tone
- A skill that generates a list of test cases from a function signature

---

## Tier 2: Medium

**Choose Medium when any of the following are true:**
- The output must follow a specific template structure that would be unwieldy to describe inline (a PR template, a report skeleton, a config file format)
- The skill shares a template or asset with other skills in the same skillset
- The skill needs to reference a small, stable dataset (e.g., a list of commit types, a taxonomy) that would bloat the instructions if written inline

**Resulting directory layout:**
```
skill-name/
├── SKILL.md
└── assets/
    └── template-or-data-file.md
```

**Examples of Medium skills:**
- A skill that fills in a PR description template
- A skill that produces a changelog entry using a structured format
- A skill that writes a README from a project template

**Decision rule:** If the template or data file is longer than ~20 lines, or if it would be confusing to embed inline in the instructions, extract it to `assets/`.

---

## Tier 3: Complex

**Choose Complex when any of the following are true:**
- The skill requires Claude to load substantial background knowledge before acting (framework docs, style guides, pattern references longer than ~80 lines)
- The skill needs the user to run a script and paste back structured output (e.g., parse git log, detect installed packages, scan file tree)
- The skill combines a template (`assets/`) with reference knowledge (`references/`) or user-run automation (`scripts/`)

**Resulting directory layout:**
```
skill-name/
├── SKILL.md
├── assets/
│   └── output-template.md
├── references/
│   └── background-knowledge.md
└── scripts/
    └── helper.sh
```

**Examples of Complex skills:**
- A skill that writes tests matching project conventions (needs framework detection script + pattern reference)
- A skill that generates a CHANGELOG (needs git parsing script + output template + commit-type mapping)
- A skill that produces a competitive analysis report (needs a report template + analysis framework reference)

**Decision rule:** If you find yourself writing more than ~80 lines of background content inline in `SKILL.md`, stop and extract it to `references/`. If the skill needs to ask the user to run a command, create a `scripts/` helper for it.

---

## Common mistakes

| Mistake | Correct approach |
|---------|-----------------|
| Creating `assets/` for a template that's only 5 lines | Embed the template inline in the Instructions |
| Creating `references/` for a 10-line taxonomy | Put it in the Instructions or in `assets/` |
| Writing a script to do something Claude can infer from pasted text | Remove the script; ask the user to paste the relevant content |
| Using `assets/` for background knowledge | Move background knowledge to `references/`; `assets/` is for templates and data |
| Creating all three directories "just in case" | Only create directories the skill actually uses |

---

## Upgrade path

Start at Simple. If you find yourself writing a template inline that's getting long → upgrade to Medium and extract it. If you find yourself embedding a large reference inline or needing to parse structured data → upgrade to Complex and add the right directory. Never pre-emptively create directories for future needs.
