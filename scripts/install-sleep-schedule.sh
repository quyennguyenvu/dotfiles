#!/usr/bin/env bash
#
# install-sleep-schedule.sh
#
# Schedules macOS to toggle the "Prevent automatic sleeping when the display
# is off" setting (which is just `pmset -c sleep`) on weekdays:
#
#   WAKE_HOUR  (default 09:00 Mon-Fri) -> pmset -c sleep 0   = checkbox ON  (stay awake)
#   SLEEP_HOUR (default 18:00 Mon-Fri) -> pmset -c sleep N   = checkbox OFF (allow sleep)
#
# Implemented with two LaunchDaemons in /Library/LaunchDaemons (run as root,
# which is required to change the -c power profile).
#
# Usage:
#   sudo bash install-sleep-schedule.sh
#
# Re-running is safe: it overwrites and reloads the jobs (so edit the config
# below and just run it again).

set -euo pipefail

# ---- Config (edit to taste) -------------------------------------------------
WAKE_HOUR=9          # hour to PREVENT sleep  (start of workday)
SLEEP_HOUR=18        # hour to ALLOW sleep    (end of workday)
IDLE_MINUTES=10      # after-hours: sleep after this many idle minutes
POWER_FLAG="-c"      # -c = power adapter only, -a = all power sources
# -----------------------------------------------------------------------------

LABEL_ON="com.user.preventsleep.on"
LABEL_OFF="com.user.preventsleep.off"
PLIST_ON="/Library/LaunchDaemons/${LABEL_ON}.plist"
PLIST_OFF="/Library/LaunchDaemons/${LABEL_OFF}.plist"

if [[ "$(id -u)" -ne 0 ]]; then
  echo "This script must be run as root. Try: sudo bash $0" >&2
  exit 1
fi

# write_plist <path> <label> <hour> <pmset-arg> [<pmset-arg> ...]
write_plist() {
  local path="$1" label="$2" hour="$3"; shift 3

  local args_xml=""
  local a
  for a in "$@"; do
    args_xml+="        <string>${a}</string>"$'\n'
  done

  # Mon=1 ... Fri=5
  local cal_xml="" wd
  for wd in 1 2 3 4 5; do
    cal_xml+="        <dict><key>Hour</key><integer>${hour}</integer><key>Minute</key><integer>0</integer><key>Weekday</key><integer>${wd}</integer></dict>"$'\n'
  done

  cat > "$path" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key><string>${label}</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/pmset</string>
${args_xml}    </array>
    <key>StartCalendarInterval</key>
    <array>
${cal_xml}    </array>
</dict>
</plist>
EOF
}

echo "Writing ${PLIST_ON} ..."
write_plist "$PLIST_ON" "$LABEL_ON" "$WAKE_HOUR" "$POWER_FLAG" "sleep" "0"

echo "Writing ${PLIST_OFF} ..."
write_plist "$PLIST_OFF" "$LABEL_OFF" "$SLEEP_HOUR" "$POWER_FLAG" "sleep" "$IDLE_MINUTES"

echo "Setting ownership (root:wheel) and permissions (644) ..."
chown root:wheel "$PLIST_ON" "$PLIST_OFF"
chmod 644 "$PLIST_ON" "$PLIST_OFF"

echo "Reloading launchd jobs ..."
# load/unload is used for broad macOS compatibility; the modern equivalents are
# `launchctl bootout system <plist>` and `launchctl bootstrap system <plist>`.
launchctl unload "$PLIST_ON"  2>/dev/null || true
launchctl unload "$PLIST_OFF" 2>/dev/null || true
launchctl load -w "$PLIST_ON"
launchctl load -w "$PLIST_OFF"

echo
echo "Done. Schedule installed:"
printf '  %02d:00 Mon-Fri  -> pmset %s sleep 0   (stay awake)\n' "$WAKE_HOUR" "$POWER_FLAG"
printf '  %02d:00 Mon-Fri  -> pmset %s sleep %s  (allow sleep)\n' "$SLEEP_HOUR" "$POWER_FLAG" "$IDLE_MINUTES"
echo
echo "Verify with:"
echo "  pmset -g | grep ' sleep'"
echo "  sudo launchctl list | grep preventsleep"
echo
echo "Note: if the Mac is asleep at ${WAKE_HOUR}:00, launchd runs the missed job"
echo "the moment you wake it, so it still flips on shortly after you sit down."
