---
name: competitive-analysis
description: "Generates structured competitor breakdowns from information you provide. Uses a bundled analysis framework to evaluate competitors across consistent dimensions — positioning, pricing, features, weaknesses, and moat — and outputs a formatted report ready to share with stakeholders or paste into a product document."
version: "1.0.0"
tags: [research, competitive-analysis, product, strategy, analysis]
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to analyze one or more competitors in a structured way.

### Bundled resources

- `references/analysis-framework.md` — defines the evaluation dimensions and what to look for in each one. Load this before analyzing any competitor. Apply the framework consistently across all competitors so the output is directly comparable.
- `assets/report-template.md` — the output structure. Load it and fill every section. Do not invent new sections or omit existing ones.

### Shared reference

Load `../assets/audience-personas.md`. Step 1 asks who the report is for; this file defines the audience archetypes shared across this skillset — each with a vocabulary level, assumed prior knowledge, and preferred level of detail.

Match the stated audience to the closest persona and hold to that profile throughout, so a competitive analysis reads at the same register as anything else this skillset produces for the same reader.

### Workflow

1. **Gather inputs**: Ask the user for:
   - The product or company being analyzed (the subject — your product or a hypothetical)
   - The list of competitors to analyze (1 or more)
   - The source information for each competitor (websites, pricing pages, reviews, press releases, internal notes — whatever they have)
   - The intended audience for the report (who will read it and what decision will it inform?)

2. **Load the analysis framework** from `references/analysis-framework.md`. Internalize the dimensions and what good evidence looks like for each.

3. **Analyze each competitor** using the framework dimensions:
   - Work through the source material methodically
   - Note gaps — if a dimension cannot be assessed from available information, say so explicitly rather than guessing
   - Look for patterns across competitors (shared weaknesses, pricing clusters, positioning overlap)

4. **Fill the report template** from `assets/report-template.md`:
   - One section per competitor following the framework dimensions
   - A cross-competitor summary with the key patterns
   - A section on implications for the subject (what opportunities or threats does this landscape reveal?)

5. Output the completed report in a markdown code block.

### Rules

- Only include information from the sources the user provided — do not hallucinate product features or pricing
- If a data point is inferred rather than stated explicitly, mark it as "(inferred)" 
- If a dimension cannot be assessed from available information, write "Insufficient data" rather than guessing
- Keep the per-competitor analysis comparable in depth — do not write 500 words on one and 50 on another
- The "Implications" section is the most valuable part — prioritize it and make it specific, not generic
