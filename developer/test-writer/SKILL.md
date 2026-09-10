---
name: test-writer
description: "Writes tests that match your project's existing test patterns and conventions. Detects the test framework in use, reads nearby test files to understand naming and structure conventions, and generates tests for the code you point it at — without introducing a different style."
version: "1.0.0"
tags:
  - testing
  - developer
  - jest
  - vitest
  - pytest
  - workflow
author: skilldex-examples
---

## Instructions

Use this skill when the user wants to write tests for a specific function, module, or feature.

### Bundled resources

- `scripts/detect-framework.sh` — detects the test framework used in a project from package.json, config files, and file extensions. Ask the user to run it if the framework is not obvious from context.
- `references/testing-patterns.md` — describes common structural conventions for each supported framework (describe/it nesting, setup/teardown, assertion style, mocking approach). Load this before writing any tests.

### Workflow

1. **Identify the target**: Ask the user which function, class, or module they want tested, and get the source code if not already in context.

2. **Detect the framework**: If not already clear, ask the user to run:
   ```bash
   bash path/to/test-writer/scripts/detect-framework.sh
   ```
   Use the output to determine the framework. If detection fails, ask directly.

3. **Read existing tests**: Ask the user to share one or two existing test files from the project. This is critical — use them to infer:
   - File naming convention (`*.test.ts`, `*.spec.js`, `_test.go`, etc.)
   - Describe/it block nesting depth
   - How imports are structured
   - Whether the project uses mocks, stubs, or real dependencies
   - Assertion library in use

4. **Load testing patterns**: Consult `references/testing-patterns.md` for the detected framework's standard conventions. Reconcile with what you observed in existing test files — project conventions override the reference when they conflict.

5. **Write the tests**: Generate a test file that:
   - Follows the exact naming and structure conventions from the existing files
   - Covers the happy path, edge cases, and expected error conditions
   - Uses the same import style and assertion methods as existing tests
   - Does not import test utilities or helpers that do not exist in the project

6. **Output**: Present the full test file in a code block with the correct file extension.

### Rules

- Never invent test helpers or fixtures that don't exist in the project
- Match the existing test file structure precisely — if the project uses flat `test()` calls, don't introduce `describe` blocks
- If you cannot determine a convention from the existing files, ask before guessing
- Write one test file at a time; if the user wants tests for multiple files, address them sequentially
- When suggesting a commit for the generated tests, follow `../assets/commit-conventions.md` — tests are the `test` type, scoped to the area under test (`test(auth): ...`), which keeps them out of the changelog
