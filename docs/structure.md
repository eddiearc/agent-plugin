# Repository Structure

`agent-plugin` is an extensible plugin repository for Claude-style and Codex-style runtimes.

The repository is intentionally organized by capability type, so hooks, commands, and skills can evolve independently.

## Layout

- `.claude-plugin/`
  Claude-compatible marketplace and plugin manifests.
- `.codex-plugin/`
  Codex-compatible plugin manifest.
- `.agents/plugins/`
  Codex marketplace descriptor.
- `commands/`
  User-invocable slash commands such as `/setup`.
- `hooks/`
  Runtime hooks triggered by lifecycle events.
- `skills/`
  Links to standalone skill repositories.
- `docs/`
  Repository documentation and conventions.

## Current Capabilities

- `hooks/personal-reminders.sh`
  Injects unfinished items from the Apple Reminders `Personal` list into session context.
- `commands/setup.md`
  Describes dependency installation and hook wiring.
- [`eddiearc/grade-ai-draft`](https://github.com/eddiearc/grade-ai-draft)
  Standalone skill repository for a local UI that lets users grade AI-written drafts and returns structured rewrite comments for agents to apply.

## Conventions

- Keep each runtime capability in the directory that matches its execution model.
- Update both Claude and Codex manifests when package identity or install behavior changes.
- Prefer additive capabilities over encoding everything into a single hook script.
- Document new top-level capabilities in `README.md` and this file when the structure changes.
