#!/usr/bin/env bash
# detect-framework.sh
# Detects the test framework used in the current project.
# Run from the project root.
#
# Checks (in order):
#   1. package.json scripts and devDependencies (JS/TS projects)
#   2. Config files (jest.config.*, vitest.config.*, pytest.ini, etc.)
#   3. go.mod (Go projects — uses built-in testing package)
#   4. Gemfile / .gemspec (Ruby — RSpec or Minitest)
#   5. File extension patterns in existing test files

set -euo pipefail

DETECTED=""
DETAILS=""

detect_js() {
  if [[ ! -f "package.json" ]]; then return; fi

  # Check devDependencies
  if command -v jq &>/dev/null; then
    local deps
    deps=$(jq -r '(.devDependencies // {}) + (.dependencies // {}) | keys[]' package.json 2>/dev/null || echo "")

    if echo "$deps" | grep -q "^vitest$"; then
      DETECTED="vitest"
      DETAILS="found in package.json devDependencies"
      return
    fi
    if echo "$deps" | grep -q "^jest$\|^@jest/core$"; then
      DETECTED="jest"
      DETAILS="found in package.json devDependencies"
      return
    fi
    if echo "$deps" | grep -q "^mocha$"; then
      DETECTED="mocha"
      DETAILS="found in package.json devDependencies"
      return
    fi
  fi

  # Check scripts
  local test_script
  test_script=$(grep -o '"test"[[:space:]]*:[[:space:]]*"[^"]*"' package.json 2>/dev/null | head -1 || echo "")
  if echo "$test_script" | grep -qi "vitest"; then
    DETECTED="vitest"; DETAILS="found in package.json test script"; return
  fi
  if echo "$test_script" | grep -qi "jest"; then
    DETECTED="jest"; DETAILS="found in package.json test script"; return
  fi
  if echo "$test_script" | grep -qi "mocha"; then
    DETECTED="mocha"; DETAILS="found in package.json test script"; return
  fi
}

detect_config_files() {
  if ls vitest.config.* 2>/dev/null | grep -q .; then
    DETECTED="vitest"; DETAILS="vitest.config file found"; return
  fi
  if ls jest.config.* 2>/dev/null | grep -q .; then
    DETECTED="jest"; DETAILS="jest.config file found"; return
  fi
  if [[ -f "pytest.ini" || -f "pyproject.toml" && $(grep -l "pytest" pyproject.toml 2>/dev/null) ]]; then
    DETECTED="pytest"; DETAILS="pytest config found"; return
  fi
  if [[ -f "setup.cfg" ]] && grep -q "\[tool:pytest\]" setup.cfg 2>/dev/null; then
    DETECTED="pytest"; DETAILS="pytest section in setup.cfg"; return
  fi
}

detect_go() {
  if [[ -f "go.mod" ]]; then
    DETECTED="go-test"; DETAILS="go.mod found — uses built-in testing package"; return
  fi
}

detect_ruby() {
  if [[ -f "Gemfile" ]]; then
    if grep -q "rspec" Gemfile 2>/dev/null; then
      DETECTED="rspec"; DETAILS="rspec found in Gemfile"; return
    fi
    if grep -q "minitest" Gemfile 2>/dev/null; then
      DETECTED="minitest"; DETAILS="minitest found in Gemfile"; return
    fi
  fi
}

detect_from_files() {
  # Look at test file extensions as a last resort
  if find . -name "*.test.ts" -o -name "*.spec.ts" 2>/dev/null | grep -q .; then
    DETECTED="jest-or-vitest (TypeScript)"; DETAILS="inferred from .test.ts/.spec.ts files"
  elif find . -name "*.test.js" -o -name "*.spec.js" 2>/dev/null | grep -q .; then
    DETECTED="jest-or-mocha (JavaScript)"; DETAILS="inferred from .test.js/.spec.js files"
  elif find . -name "*_test.go" 2>/dev/null | grep -q .; then
    DETECTED="go-test"; DETAILS="inferred from _test.go files"
  elif find . -name "test_*.py" -o -name "*_test.py" 2>/dev/null | grep -q .; then
    DETECTED="pytest"; DETAILS="inferred from test_*.py files"
  elif find . -name "*_spec.rb" 2>/dev/null | grep -q .; then
    DETECTED="rspec"; DETAILS="inferred from *_spec.rb files"
  fi
}

# Run detectors in order
detect_js
if [[ -z "$DETECTED" ]]; then detect_config_files; fi
if [[ -z "$DETECTED" ]]; then detect_go; fi
if [[ -z "$DETECTED" ]]; then detect_ruby; fi
if [[ -z "$DETECTED" ]]; then detect_from_files; fi

if [[ -n "$DETECTED" ]]; then
  echo "FRAMEWORK: $DETECTED"
  echo "DETECTION: $DETAILS"
else
  echo "FRAMEWORK: unknown"
  echo "DETECTION: could not determine framework automatically"
  echo "HINT: share your package.json, go.mod, or an existing test file"
fi
