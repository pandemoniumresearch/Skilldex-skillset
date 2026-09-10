---
name: skillset-creator
description: "A collection of Claude skills for authoring Claude skills and skillsets. Covers designing a single skill at the right complexity level, writing well-structured SKILL.md instructions, building supporting assets and references, and packaging multiple skills into a full skillset with a shared manifest."
version: "1.0.0"
tags:
  - meta
  - skill-authoring
  - skillset
  - developer
  - tooling
author: skilldex-examples
spec_version: "1.0"
---

# Skillset Creator

Skills for building skills — use these when you want to create, structure, or review Claude skill packages.

## Shared Assets

The `assets/` directory contains resources shared across skills in this set:

- `assets/skill-anatomy.md` — the full specification for `SKILL.md` and `SKILLSET.md` files: every frontmatter field, every section, naming rules, and conventions. Both skills in this set load it as the authoritative reference.

## Skills

- **skill-author** — guides you through designing and writing a single skill from scratch, at the right complexity level, with the right supporting files
- **skillset-author** — guides you through packaging multiple related skills into a coherent skillset with a shared manifest, shared assets, and a clear install story
