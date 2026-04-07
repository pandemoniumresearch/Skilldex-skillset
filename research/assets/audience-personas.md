# Audience Personas

Shared reference for calibrating explanations and summaries to a specific audience.
Used by `technical-explainer` and `paper-summarizer`.

When the user names an audience, match it to the closest persona below and apply that profile.
If the user describes a custom audience not listed here, derive a profile using the same dimensions.

---

## Personas

### `junior-dev`
**Vocabulary level:** Intermediate technical — knows programming basics, familiar with common tools (git, CLI, basic web concepts), but has not yet built intuition for architecture or system design trade-offs.
**Assumed prior knowledge:** Variables, functions, loops, basic HTTP, one or two languages. May not know design patterns, async concepts, or system-level details.
**Explanation style:** Use analogies to things they've already built. Step through logic sequentially. Avoid assuming they know "why" something is designed a certain way — explain that too. Code snippets are welcome and helpful.
**Avoid:** Unexplained jargon, assuming familiarity with paradigms (e.g., "this is just a monad"), skipping steps that seem obvious to a senior developer.

---

### `senior-dev`
**Vocabulary level:** High technical — fluent in multiple paradigms, comfortable with trade-offs, familiar with the concepts being discussed.
**Assumed prior knowledge:** Design patterns, concurrency, system design, performance characteristics, testing strategies. Can read code in unfamiliar languages.
**Explanation style:** Get to the point. Focus on the interesting trade-offs and non-obvious decisions. Skip basic definitions. Reference related concepts by name.
**Avoid:** Over-explaining fundamentals, unnecessary analogies, padding with background they already have.

---

### `non-technical-pm`
**Vocabulary level:** Business and product — understands goals, user impact, timelines, and risk. Not familiar with implementation detail.
**Assumed prior knowledge:** Product lifecycle, user stories, A/B testing, basic data concepts. Does not know how code works.
**Explanation style:** Lead with impact and outcome ("this means users will be able to…", "this reduces the risk of…"). Use analogies from everyday life or business. Avoid any code. Use numbers and comparisons where possible.
**Avoid:** Any code or pseudocode, implementation-level detail, acronyms without explanation, assuming interest in how something works internally.

---

### `domain-expert`
**Vocabulary level:** Deep in their field but potentially unfamiliar with the technical implementation.
**Assumed prior knowledge:** The subject matter domain (e.g., biology, finance, law) but not necessarily the software or systems used to implement it.
**Explanation style:** Respect their domain expertise — don't over-explain domain concepts. Focus on bridging from their domain knowledge to the technical concept being explained. Use domain vocabulary they already know as the anchor.
**Avoid:** Condescension about domain knowledge, ignoring domain context, being too abstract when their domain provides a perfect concrete frame.

---

### `executive`
**Vocabulary level:** Strategic — focused on decisions, risk, and ROI. Not interested in implementation.
**Assumed prior knowledge:** Business context, competitive landscape, broad technology trends. Not implementation-level detail.
**Explanation style:** Lead with the decision or implication ("the bottom line is…", "this means we can/cannot…"). One paragraph maximum for context, then a clear recommendation or summary. Bullet points over prose.
**Avoid:** Technical depth, hedging without a conclusion, long explanations with no clear takeaway.
