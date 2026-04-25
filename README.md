# agent-plugin

An extensible plugin repository for Claude-style and Codex-style runtimes.

It currently ships one Apple Reminders hook and one prose revision skill, while staying organized as a multi-capability plugin.

## Current Capabilities

- `hooks/personal-reminders.sh`
  Reads unfinished items from the `Personal` reminders list and injects them into session context on start.
- `commands/setup.md`
  Documents dependency installation and hook configuration.
- `skills/ai-redraft/`
  Opens a local draft annotation UI so a user can mark exact passages and give rewrite instructions before an agent edits the source file.

## Repository Layout

- `.claude-plugin/`
  Claude-compatible manifests.
- `.codex-plugin/`
  Codex-compatible manifest.
- `.agents/plugins/`
  Codex marketplace descriptor.
- `commands/`
  Slash commands.
- `hooks/`
  Lifecycle hooks.
- `skills/`
  Reusable agent skills.
- `docs/`
  Repository documentation.

Detailed structure notes live in [docs/structure.md](./docs/structure.md).

## Install

Claude-style install:

```json
{
  "extraKnownMarketplaces": {
    "agent-plugin": {
      "source": {
        "source": "github",
        "repo": "eddiearc/agent-plugin"
      }
    }
  },
  "enabledPlugins": {
    "agent-plugin@agent-plugin": true
  }
}
```

Codex-style local packaging expectations:

- `.claude-plugin/plugin.json`
- `.codex-plugin/plugin.json`
- `.agents/plugins/marketplace.json`

Then run `/setup`.

## Requirements

- macOS
- `remindctl` (`brew install steipete/tap/remindctl`)
- Python 3

## Expansion Rules

- Add new hooks under `hooks/`.
- Add new slash commands under `commands/`.
- Add reusable skills under `skills/<skill-name>/`.
- Keep Claude and Codex manifests aligned when the package identity or install surface changes.
