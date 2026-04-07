# Testing Patterns Reference

Conventions for common test frameworks. Use this as a starting point —
always defer to the project's existing test files when they conflict with
what's written here.

---

## Jest (JavaScript / TypeScript)

**File naming:** `*.test.ts`, `*.test.js`, `*.spec.ts`, `*.spec.js`

**Structure:**
```ts
import { myFunction } from '../src/myModule'

describe('myFunction', () => {
  it('returns the expected value for valid input', () => {
    expect(myFunction('hello')).toBe('HELLO')
  })

  it('throws when input is null', () => {
    expect(() => myFunction(null)).toThrow(TypeError)
  })
})
```

**Conventions:**
- `describe` wraps the unit under test; `it` describes a single behaviour
- Assertion library: `expect(...).toBe / toEqual / toThrow / toMatchSnapshot`
- Async: `async/await` with `expect(promise).resolves.toBe(...)` or `rejects.toThrow(...)`
- Mocking: `jest.fn()`, `jest.spyOn()`, `jest.mock('module-path')`
- Setup/teardown: `beforeEach / afterEach / beforeAll / afterAll`

---

## Vitest (JavaScript / TypeScript)

**File naming:** `*.test.ts`, `*.spec.ts` (identical to Jest)

**Structure:** Nearly identical to Jest. Import from `vitest` explicitly:

```ts
import { describe, it, expect, vi, beforeEach } from 'vitest'
import { myFunction } from '../src/myModule'

describe('myFunction', () => {
  it('returns the expected value', () => {
    expect(myFunction('hello')).toBe('HELLO')
  })
})
```

**Key differences from Jest:**
- Import `vi` instead of using the global `jest` object: `vi.fn()`, `vi.spyOn()`
- `vi.mock()` instead of `jest.mock()`
- Supports ESM natively without transform config

---

## pytest (Python)

**File naming:** `test_*.py` or `*_test.py`

**Structure:**
```python
import pytest
from mymodule import my_function

def test_returns_expected_value():
    assert my_function("hello") == "HELLO"

def test_raises_on_none_input():
    with pytest.raises(TypeError):
        my_function(None)

class TestMyFunction:
    def test_with_valid_input(self):
        assert my_function("world") == "WORLD"
```

**Conventions:**
- Function names must start with `test_`
- Use `assert` statements directly — no assertion library needed
- Fixtures via `@pytest.fixture` and function arguments
- Parametrize: `@pytest.mark.parametrize("input,expected", [...])`
- Mocking: `unittest.mock.patch` or `pytest-mock`'s `mocker` fixture

---

## Go (built-in `testing` package)

**File naming:** `*_test.go` in the same package

**Structure:**
```go
package mypackage_test

import (
    "testing"
    "github.com/your/repo/mypackage"
)

func TestMyFunction(t *testing.T) {
    got := mypackage.MyFunction("hello")
    want := "HELLO"
    if got != want {
        t.Errorf("MyFunction(%q) = %q, want %q", "hello", got, want)
    }
}

func TestMyFunction_NilInput(t *testing.T) {
    defer func() {
        if r := recover(); r == nil {
            t.Error("expected panic on nil input")
        }
    }()
    mypackage.MyFunction("")
}
```

**Conventions:**
- Test functions must be `TestXxx(t *testing.T)` — capital X after Test
- Table-driven tests are idiomatic:
  ```go
  tests := []struct{ input, want string }{
      {"hello", "HELLO"},
      {"world", "WORLD"},
  }
  for _, tt := range tests {
      t.Run(tt.input, func(t *testing.T) {
          if got := MyFunction(tt.input); got != tt.want {
              t.Errorf(...)
          }
      })
  }
  ```
- Mocking: interfaces + hand-rolled fakes, or `github.com/stretchr/testify/mock`

---

## RSpec (Ruby)

**File naming:** `*_spec.rb` under `spec/`

**Structure:**
```ruby
require 'spec_helper'
require 'my_module'

RSpec.describe MyModule do
  describe '#my_method' do
    it 'returns the expected value' do
      expect(MyModule.my_method('hello')).to eq('HELLO')
    end

    it 'raises on nil input' do
      expect { MyModule.my_method(nil) }.to raise_error(TypeError)
    end
  end
end
```

**Conventions:**
- `describe` + `context` for grouping; `it` for individual examples
- Matchers: `eq`, `be`, `include`, `raise_error`, `change`
- Setup: `before(:each)` / `let` / `subject`
- Mocking: `allow(obj).to receive(:method).and_return(value)`
