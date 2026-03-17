# List available commands
default:
    @just --list

# Run linting (ruff check + pyright)
lint:
    uv run ruff check .
    uv run pyright

# Run ruff formatter
format:
    uv run ruff format .

# Run tests
test:
    uv run pytest

# Run all checks without modifying files (format check + lint + type check + tests)
check:
    uv run ruff format --check .
    uv run ruff check .
    uv run pyright
    uv run pytest

# Auto-fix linting issues and format code
fix:
    uv run ruff check --fix .
    uv run ruff format .

# Install/update dependencies
sync:
    uv sync
