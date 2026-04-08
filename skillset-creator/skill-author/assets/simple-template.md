# Simple Skill Template

Use this as a starting point for Tier 1 skills. Replace every `<placeholder>` with real content. Delete this header and all HTML comments before delivering the final file.

---

```markdown
---
name: <kebab-case-name>
description: "<One sentence starting with a verb. ≤200 chars. Describes what the skill does, not what it is.>"
version: "1.0.0"
tags: [<tag1>, <tag2>]
author: <author-handle>
---

## Instructions

Use this skill when the user wants to <goal in plain language>.

<!-- If this skill loads a file from the skillset's shared assets/ directory, add:
### Shared reference
Before doing anything, load `../assets/<filename>.md` and apply it strictly.
Otherwise, delete this section.
-->

### Workflow

1. <First action. What does Claude do first? Be specific.>
2. <Second action. What information does Claude gather or infer?>
3. <Third action. What does Claude produce?>

<!-- Add or remove steps as needed. Every step must be a concrete action, not a vague check. -->

### Rules

- Never <hard constraint — something the skill must never do>
- Always <hard invariant — something the skill must always do>
- <Add rules for edge cases that might trip up the skill>

### Example output

<!-- Show one concrete example of good output. Use a fenced code block. -->

\`\`\`
<example output here>
\`\`\`
```
