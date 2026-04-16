---
name: setup
description: Setup idan-cc-plugin - install dependencies and configure hooks
---

# Setup idan-cc-plugin

## Steps

1. Check if `remindctl` is installed, if not install it:

```bash
which remindctl || brew install steipete/tap/remindctl
```

2. Grant Reminders permission when prompted by macOS.

3. Add the SessionStart hook to your settings. Read the user's `~/.claude/settings.json`, then add this to the `hooks.SessionStart` array (merge with existing hooks, don't replace):

```json
{
  "hooks": [
    {
      "type": "command",
      "command": "bash ${PLUGIN_DIR}/hooks/personal-reminders.sh",
      "timeout": 10,
      "statusMessage": "检查 Personal 提醒事项..."
    }
  ]
}
```

Where `${PLUGIN_DIR}` is the absolute path to this plugin's installation directory (the directory containing this file's parent).

4. Verify the hook works by running:

```bash
bash ${PLUGIN_DIR}/hooks/personal-reminders.sh
```

5. Tell the user: "Setup complete! Next time you start a new conversation, you'll see your incomplete Personal reminders."
