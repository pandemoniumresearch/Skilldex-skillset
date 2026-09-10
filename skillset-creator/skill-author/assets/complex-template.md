# Complex Skill Template

Use this as a starting point for Tier 3 skills (SKILL.md + assets/ + references/ and/or scripts/). Replace every `<placeholder>` with real content. Delete this header and all HTML comments before delivering the final file.

Only include the directories your skill actually uses. If your skill doesn't need a script, omit `scripts/`. If it doesn't need reference docs, omit `references/`.

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

- `assets/<template>.md` — output format; load and use it exactly
- `references/<guide>.md` — <background knowledge the skill needs; load before writing>
- `scripts/<helper>.sh` — <what it does; ask the user to run it and share output>

<!-- List only files that exist. Remove lines for directories you're not using. -->

### Workflow

1. **Gather inputs.** Ask the user to run the bundled script if needed:
   ```bash
   bash path/to/<skill-name>/scripts/<helper>.sh
   ```
   If the user cannot run the script, ask for the output of:
   ```bash
   <manual fallback command>
   ```

2. **Load reference.** Read `references/<guide>.md` before producing any output. Apply it strictly.

3. **Load template.** Read `assets/<template>.md`. Use it as the exact output structure.

4. <Core logic step: what does Claude infer, classify, or transform from the inputs?>

5. <Fill in the template using the results of step 4.>

6. **Output.** Present the filled template in a fenced code block. Ask if the user wants any adjustments.

### Rules

- Always load `references/<guide>.md` before writing — never rely on general knowledge when the reference is available
- Never alter the structure of `assets/<template>.md` — fill it in, do not redesign it
- Never <other hard constraint specific to this skill>
- Provide a manual fallback whenever you ask the user to run a script
```

---

## assets/\<template\>.md

```markdown
<!-- Full output template. Claude fills this in. -->
<!-- Annotate each section so it's clear what belongs there. -->

# <Title>

## <Section 1>

<!-- What goes here -->

## <Section 2>

<!-- What goes here -->
```

---

## references/\<guide\>.md

```markdown
# <Reference Title>

<!-- Background knowledge Claude needs to act correctly.
     This is not instructions — it's facts, taxonomies, conventions, or patterns.
     Keep under ~600 lines. Split into multiple files if larger. -->

## <Topic 1>

<content>

## <Topic 2>

<content>
```

---

## scripts/\<helper\>.sh

```bash
#!/usr/bin/env bash
# <skill-name>: <helper>
#
# What this script does: <one line>
# How to run: bash path/to/<skill-name>/scripts/<helper>.sh
# Output: <describe what the script prints — Claude will read this output>

set -euo pipefail

# <script body>
echo "Script output goes here"
```

---

## Directory layout

```
<skill-name>/
├── SKILL.md
├── assets/
│   └── <template>.md
├── references/
│   └── <guide>.md
└── scripts/
    └── <helper>.sh
```
