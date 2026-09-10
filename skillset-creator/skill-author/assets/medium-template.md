# Medium Skill Template

Use this as a starting point for Tier 2 skills (SKILL.md + assets/). Replace every `<placeholder>` with real content. Delete this header and all HTML comments before delivering the final file.

The `assets/` directory holds output templates or small data files the skill references. Write the full contents of each asset file — never leave them as stubs.

---

## SKILL.md

```markdown
---
name: <kebab-case-name>
description: "<One sentence starting with a verb. ≤200 chars.>"
version: "1.0.0"
tags:
  - <tag1>
  - <tag2>
author: <author-handle>
---

## Instructions

Use this skill when the user wants to <goal>.

<!-- If this skill loads a file from the skillset's shared assets/ directory, add:
### Shared reference
Before doing anything, load `../assets/<filename>.md` and apply it strictly.
Otherwise, delete this section.
-->

### Bundled resources

- `assets/<template-file>.md` — <what it is and how the skill uses it>

<!-- List every file in assets/. One line per file. -->

### Workflow

1. <Gather inputs: what does Claude need before it can act? Ask for anything not in context.>
2. Load `assets/<template-file>.md`. Use it as the exact output structure — do not invent a different layout.
3. <Fill in the template: describe which sections get filled with what information.>
4. <Output: how does the result get presented? Code block? Plain text? With labels?>

### Rules

- Never alter the structure of the template — fill it in, do not redesign it
- Never <other hard constraint>
- Always <hard invariant>
- Write "N/A" rather than omitting a template section that does not apply
```

---

## assets/\<template-file\>.md

```markdown
<!-- Full template contents go here. This is what Claude fills in. -->
<!-- Use HTML comments to annotate what goes in each section. -->
<!-- Keep it concise — this is the output skeleton, not a guide. -->

# <Title or heading>

## <Section 1>

<!-- What goes here -->

## <Section 2>

<!-- What goes here -->
```

---

## Directory layout

```
<skill-name>/
├── SKILL.md
└── assets/
    └── <template-file>.md
```
