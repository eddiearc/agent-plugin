# agent-plugin

Apple Reminders session plugin packaged to work with both Claude-style and Codex-style plugin loaders.

## Features

- **Apple Reminders Hook** — shows incomplete `Personal` reminders every time a new session starts

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
