# agent-plugin

Extensible plugin repository for Claude and Codex.

This repo is not limited to a single hook. It is structured as a general plugin package that currently contains an Apple Reminders hook and reusable agent skills.

## Features

### Apple Reminders Hook (SessionStart)
- `hooks/personal-reminders.sh` — checks incomplete items in the "Personal" reminders list
- Displays reminders as a `systemMessage` on session start
- Also injects into `additionalContext` so Claude is aware of pending tasks

### AI Redraft Skill
- `skills/ai-redraft/` — opens a local UI for marking exact prose passages with rewrite comments
- Writes structured sidecar annotations for the agent to apply back to the draft

## Repository Layout

- `commands/` — slash commands
- `hooks/` — lifecycle hooks
- `skills/` — reusable skills
- `docs/` — repository documentation
- `.claude-plugin/`, `.codex-plugin/`, `.agents/plugins/` — runtime manifests that must stay aligned

## Dependencies
- `remindctl` — CLI for Apple Reminders (`brew install steipete/tap/remindctl`)
- macOS only (Apple Reminders)
- Python 3 (for JSON processing)

## Commands
- `/setup` — Install dependencies and configure the SessionStart hook

## Maintenance Rules

- Update both Claude and Codex manifests when changing package name, install flow, or capability surface.
- Prefer adding new capabilities in new files/directories instead of overloading `personal-reminders.sh`.
- Reflect new top-level capabilities in `README.md` and `docs/structure.md`.
