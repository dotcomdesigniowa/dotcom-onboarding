#!/usr/bin/env bash
# install-sync.sh — Installs the daily sync as a Windows Scheduled Task
set -e
OS_ROOT="${1:-$HOME/Desktop/OS}"
RUN_TIME="${2:-17:00}"
SYNC_SCRIPT="$OS_ROOT/.sync.sh"
TASK_NAME="DotcomDailySync"
if [ ! -f "$SYNC_SCRIPT" ]; then
  echo "ERROR: .sync.sh not found at $SYNC_SCRIPT"
  exit 1
fi
chmod +x "$SYNC_SCRIPT"
schtasks.exe //Create //TN "$TASK_NAME" //TR "bash -c '$SYNC_SCRIPT'" //SC DAILY //ST "$RUN_TIME" //F 2>/dev/null || {
  echo "WARNING: Could not create scheduled task. Set it up manually in Task Scheduler."
  exit 1
}
echo "SUCCESS: Daily sync installed at $RUN_TIME"
