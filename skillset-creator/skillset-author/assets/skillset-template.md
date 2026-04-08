# Skillset Manifest Template

This is the template for `SKILLSET.md`. Claude fills this in when authoring a new skillset. Replace every `<placeholder>` with real content. Delete this header block and all HTML comments before delivering the final file.

---

```markdown
---
name: <kebab-case-name>
description: "<1–2 sentences describing the collection as a whole. Who is it for? What does it help them do?>"
version: "1.0.0"
tags: [<tag1>, <tag2>, <tag3>]
author: <author-handle>
spec_version: "1.0"
---

# <Skillset Title>

<!-- One short paragraph: what this collection is for and who should install it.
     Do not just restate the description — add context or motivation. -->

<introduction paragraph>

## Shared Assets

<!-- List every file in the top-level assets/ directory and what it does.
     One bullet per file. If there are no shared assets, delete this entire section. -->

The `assets/` directory contains resources shared across skills in this set:

- `assets/<filename>.md` — <what it contains and which skills use it>

## Skills

<!-- One bullet per skill. Bold the skill name. Short phrase after the dash. -->

- **<skill-name>** — <what it does, in ≤15 words>
- **<skill-name>** — <what it does, in ≤15 words>
```

---

## Notes for filling this in

**description:** Covers the collection as a whole — not any one skill. Should answer "why would I install this?" in one or two sentences.

**tags:** Include domain tags (e.g., `developer`, `research`, `writing`) and task tags (e.g., `git`, `testing`, `analysis`). Think of tags as the terms someone would search for to discover this skillset.

**Shared Assets section:** Only include this if files exist in the top-level `assets/` directory that are used by two or more skills. If a file is only used by one skill, it belongs in that skill's own `assets/` directory.

**Skills section:** List skills in the order a new user would likely use them — most foundational first, most advanced last. Do not include descriptions longer than a short phrase; the full description is in each skill's own `SKILL.md`.
