# idan-cc-plugin

Idan's personal Claude Code plugin.

## Features

### Apple Reminders Hook (SessionStart)
- `hooks/personal-reminders.sh` — checks incomplete items in the "Personal" reminders list
- Displays reminders as a `systemMessage` on session start
- Also injects into `additionalContext` so Claude is aware of pending tasks

## Dependencies
- `remindctl` — CLI for Apple Reminders (`brew install steipete/tap/remindctl`)
- macOS only (Apple Reminders)
- Python 3 (for JSON processing)

## Commands
- `/setup` — Install dependencies and configure the SessionStart hook
