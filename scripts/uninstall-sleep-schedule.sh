#!/usr/bin/env bash
#
# uninstall-sleep-schedule.sh
#
# Removes the weekday sleep-toggle LaunchDaemons created by
# install-sleep-schedule.sh.
#
# Usage:
#   sudo bash uninstall-sleep-schedule.sh

set -euo pipefail

PLIST_ON="/Library/LaunchDaemons/com.user.preventsleep.on.plist"
PLIST_OFF="/Library/LaunchDaemons/com.user.preventsleep.off.plist"

if [[ "$(id -u)" -ne 0 ]]; then
  echo "This script must be run as root. Try: sudo bash $0" >&2
  exit 1
fi

removed=0
for p in "$PLIST_ON" "$PLIST_OFF"; do
  if [[ -f "$p" ]]; then
    echo "Unloading and removing $p ..."
    launchctl unload "$p" 2>/dev/null || true
    rm -f "$p"
    removed=1
  fi
done

if [[ "$removed" -eq 0 ]]; then
  echo "Nothing to remove (no schedule plists found)."
else
  echo "Done. The scheduler is gone; your current pmset state is left as-is."
  echo "To force 'prevent sleep' on right now:  sudo pmset -c sleep 0"
fi
