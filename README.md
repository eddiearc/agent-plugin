# idan-cc-plugin

My personal Claude Code plugin — hooks, tools and automations.

## Features

- **Apple Reminders Hook** — shows incomplete Personal reminders every time you start a Claude Code session

## Install

Add to your `~/.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "idan-cc-plugin": {
      "source": {
        "source": "github",
        "repo": "eddiearc/idan-cc-plugin"
      }
    }
  },
  "enabledPlugins": {
    "idan-cc-plugin@idan-cc-plugin": true
  }
}
```

Then run `/setup` in Claude Code.

## Requirements

- macOS
- `remindctl` (`brew install steipete/tap/remindctl`)
- Python 3
