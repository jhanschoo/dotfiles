# Agent Instructions

## Git Config File

- You MUST use `/home/jhanschoo/.agent.gitconfig`.
- In some environments, this is already configured via `/home/jhanschoo/.gemini/.env` as `GIT_CONFIG_GLOBAL="/home/jhanschoo/.agent.gitconfig"`
- but in some other environments (e.g. where in Antigravity commands are sent to an IDE-managed terminal), this envvar is not set. You may use the same strategy and prepend the assignment to the invocation.

## Git commit format

- All commits made should follow the Conventional Commits 1.0.0 specification.

## Python Interpreter Execution

- If no Python interpreter is found, proactively attempt to activate the project's virtual environment (such as `.venv` or `venv`) and then try running the command again.