# python-base

A Python project template with modern tooling for building stable, maintainable applications.

## Renaming This Template

After cloning, rename the following to match your project:

1. **Root directory** — rename `python-base/` to `my-project/`
2. **Package directory** — rename `src/python_base/` to `src/my_project/` (use underscores)
3. **Project name in `pyproject.toml`** — change `name = "python-base"` to `name = "my-project"` (use hyphens)
4. **Imports in `tests/`** — update `from python_base.` to `from my_project.`
5. **Imports in `src/python_base/__init__.py`** — update `from python_base.` to `from my_project.`

**Convention:** project names use hyphens (`my-project`), package directories use underscores (`my_project`).

## Prerequisites

- [uv](https://docs.astral.sh/uv/getting-started/installation/) — Python package manager
- [just](https://github.com/casey/just#installation) — command runner

## Setup

```bash
uv sync                    # Install dependencies and set up virtual environment
uv run pre-commit install  # Enable git hooks for automatic code checks
```

## Available Commands

Run `just --list` to see all commands:

| Command        | Description                                      |
|----------------|--------------------------------------------------|
| `just lint`    | Run linting (ruff check + pyright)               |
| `just format`  | Run code formatter (ruff format)                 |
| `just test`    | Run tests (pytest)                               |
| `just check`   | Run all checks without modifying files           |
| `just fix`     | Auto-fix linting issues and format code          |
| `just sync`    | Install/update dependencies                      |

## Tools

This template includes the following tools, pre-configured and ready to use:

- **[uv](https://docs.astral.sh/uv/)** — Fast Python package manager. Manages your virtual environment and dependencies. Run `uv sync` to install everything, `uv run <command>` to run tools within the virtual environment.

- **[ruff](https://docs.astral.sh/ruff/)** — Linter and code formatter. Catches common errors and enforces consistent style. Replaces tools like flake8, isort, and black in a single fast tool. See [Ruff Rules](#ruff-rules) below for details on which checks are enabled.

- **[pyright](https://microsoft.github.io/pyright/)** — Type checker. Catches bugs by analyzing type hints in your code. Set to "basic" mode — strict enough to be useful, lenient enough to not overwhelm.

- **[pytest](https://docs.pytest.org/)** — Testing framework. Write tests in `tests/`, run them with `just test`. See `tests/test_calculator.py` for an example.

- **[just](https://github.com/casey/just)** — Command runner. Provides simple shortcuts for common tasks. Run `just --list` to see what's available.

- **[pre-commit](https://pre-commit.com/)** — Git hooks. Automatically runs ruff and pyright before every commit, preventing broken code from being committed.

## Ruff Rules

Ruff is configured in `pyproject.toml` with the following rule sets enabled:

| Code | Name | What it catches |
|------|------|-----------------|
| **E** | pycodestyle errors | Basic style errors — wrong indentation, whitespace issues, invalid escape sequences. |
| **W** | pycodestyle warnings | Style warnings — trailing whitespace, blank lines at end of file. |
| **F** | Pyflakes | Likely bugs — unused imports, undefined names, variables assigned but never used. |
| **I** | isort | Import sorting — keeps your imports grouped and ordered consistently. |
| **UP** | pyupgrade | Outdated syntax — rewrites old patterns to modern Python 3.12+ equivalents (e.g., `dict()` → `{}`). |
| **B** | flake8-bugbear | Common bugs — mutable default arguments, bare `except`, assigning to `os.environ`, and other traps. |
| **SIM** | flake8-simplify | Unnecessary complexity — code that can be written more simply (e.g., collapsible `if` statements, negated conditions). |
| **RUF** | Ruff-specific | Ruff's own rules — mutable class-level defaults, unused `noqa` directives, invalid `pyproject.toml`. |
| **C4** | flake8-comprehensions | Unnecessary calls — `list(...)`, `dict(...)`, or `set(...)` that could be written as comprehensions. |
| **PIE** | flake8-pie | No-op code — unnecessary `pass`, reimplemented builtins, pointless expressions. |
| **PT** | flake8-pytest-style | Pytest best practices — correct use of fixtures, `raises`, `parametrize`, and assertions. |
| **PERF** | Perflint | Performance anti-patterns — unnecessary list copies, repeated dictionary lookups, slow iteration patterns. |

All rules can be auto-fixed with `just fix` where a safe fix is available. To see what ruff would flag without changing anything, run `just check`.
