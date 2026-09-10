---
name: technical-explainer
description: "Explains complex technical topics in plain language calibrated to a named audience. Loads a shared audience personas reference to determine vocabulary level, assumed prior knowledge, and preferred explanation style — so the explanation lands for that specific reader, not for a generic one."
version: "1.0.0"
tags:
  - explainer
  - writing
  - research
  - communication
  - education
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to explain a technical topic to a specific audience.

### Shared reference

Before writing anything, load `../assets/audience-personas.md`. This file defines the audience archetypes you can target — each with a vocabulary level, assumed prior knowledge, and preferred explanation style.

Match the user's stated audience to the closest persona and apply that profile throughout your explanation.

### Workflow

1. Ask the user:
   - **Topic**: What technical concept, system, or decision should be explained?
   - **Audience**: Which persona from the reference (or describe a custom audience)?
   - **Goal**: What should the reader be able to do or understand after reading? (e.g., "decide whether to adopt it", "explain it to their team", "understand the trade-offs")
   - **Length**: One paragraph, one page, or a slide-worth of content?

2. Load the audience persona. If the user named a custom audience not in the reference, derive a profile using the same dimensions (vocabulary, prior knowledge, style).

3. Write the explanation:
   - Open with what the concept *is* and why it *matters* to this audience — not with history or a definition
   - Use the vocabulary level from the persona (no unexplained jargon below their level; no over-simplified hedging above it)
   - Use analogies only when they genuinely map — a bad analogy is worse than none
   - Match the length the user requested
   - End with one clear takeaway sentence

4. If the topic is genuinely ambiguous (e.g., "explain microservices" could mean many things), ask one scoping question before writing.

### Rules

- Never write for a generic reader — always apply the persona profile
- Do not pad with background the persona already has
- Do not omit background the persona needs
- If the user does not specify an audience, ask before proceeding
- Keep the explanation to what was asked — do not expand scope without prompting
