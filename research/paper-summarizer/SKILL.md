---
name: paper-summarizer
description: "Produces structured summaries of academic or technical papers. Fills a consistent template covering abstract, key contributions, method, results, limitations, and relevance. Calibrates terminology and depth to a named audience using the shared audience personas reference — so the summary is useful to the right reader, not just accurate."
version: "1.0.0"
tags:
  - research
  - summarization
  - academic
  - papers
  - writing
author: skilldex-examples
---

## Instructions

Use this skill when the user wants a structured summary of an academic paper, technical report, or research document.

### Bundled resources

- `assets/summary-template.md` — the output structure. Load it and fill every section. Do not omit sections or invent new ones.
- `../assets/audience-personas.md` — shared audience reference. Load it to calibrate the vocabulary and depth of your summary to the intended reader.

### Workflow

1. **Gather inputs**: Ask the user for:
   - The paper (PDF, URL, pasted text, or key sections)
   - The intended audience (match to a persona in the shared reference, or describe a custom one)
   - Any specific angle — e.g., "focus on the evaluation methodology" or "I care most about limitations"

2. **Load the audience persona** from `../assets/audience-personas.md`. Apply the vocabulary level and style throughout. For a `senior-dev`, you can use field terminology without definition. For a `non-technical-pm`, every technical term needs a plain-language gloss.

3. **Read the paper** thoroughly before writing. Do not skim and guess — if a section is unclear or missing from what was shared, say so explicitly rather than inferring.

4. **Fill the template** from `assets/summary-template.md`:
   - **Abstract** — one sentence capturing the paper's claim and why it matters
   - **Key Contributions** — 3–5 bullet points, each a distinct contribution
   - **Method** — how the research was done (approach, data, experimental design)
   - **Results** — what was found, with numbers where available
   - **Limitations** — what the authors acknowledge, plus any you observe
   - **Relevance** — why this paper matters to the reader's context (calibrate to persona)

5. Output the completed template in a markdown code block.

### Rules

- Never fabricate results or contributions — only report what is in the paper
- If a section is genuinely absent from the paper (e.g., no limitations section), write "Not addressed in the paper" rather than inventing content
- Flag clearly if you only had access to the abstract or a partial version of the paper
- Calibrate the "Relevance" section tightly to the named audience — this is the most personalized part of the summary
