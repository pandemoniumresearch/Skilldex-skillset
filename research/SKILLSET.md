---
name: research
description: "A collection of Claude skills for research, analysis, and synthesis tasks. Covers explaining technical topics to different audiences, producing structured summaries of academic and technical papers, and generating detailed competitive analysis reports from provided information."
version: "1.0.0"
tags:
  - research
  - analysis
  - synthesis
  - writing
  - explainer
author: skilldex-examples
spec_version: "1.0"
---

# Research & Synthesis Skillset

Skills for turning complex material into clear, structured output — explanations, summaries, and analysis.

## Shared Assets

The `assets/` directory at the root of this skillset contains resources shared across multiple skills:

- `assets/audience-personas.md` — defines standard audience archetypes with vocabulary level, assumed prior knowledge, and preferred explanation style. Used by both `technical-explainer` (to calibrate language) and `paper-summarizer` (to adjust summary depth and terminology).

## Skills

- **technical-explainer** — explains complex technical topics in plain language, calibrated to a named audience persona
- **paper-summarizer** — produces structured summaries of academic or technical papers using a consistent template
- **competitive-analysis** — generates detailed competitor breakdowns using a structured analysis framework and report template
