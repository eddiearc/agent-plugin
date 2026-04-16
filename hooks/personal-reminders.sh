#!/bin/bash
# Check incomplete Personal reminders and inject into Claude context
# Requires: brew install steipete/tap/remindctl

items=$(remindctl list Personal --json 2>/dev/null | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    incomplete = [r for r in data if not r.get('isCompleted', False)]
    for r in incomplete:
        due = r.get('dueDate', '')[:10]
        print(f'- [{due}] {r[\"title\"]}')
except:
    pass
" 2>/dev/null)

if [ -n "$items" ]; then
    escaped=$(echo "$items" | python3 -c "import sys,json; print(json.dumps(sys.stdin.read().strip(), ensure_ascii=False))" 2>/dev/null)
    echo "{\"systemMessage\":\"\\n📋 Personal 待办提醒:\\n${escaped:1:-1}\\n\",\"hookSpecificOutput\":{\"hookEventName\":\"SessionStart\",\"additionalContext\":\"用户的 Personal 提醒事项（未完成）:\\n${escaped:1:-1}\"}}"
fi
