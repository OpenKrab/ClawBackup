#!/bin/bash

LOG_MESSAGE="$1"

# Log to selfimprove log
echo "$LOG_MESSAGE" >> ~/.clawbackup/selfimprove.log

# If ClawSelfImprove is available, send the log
if command -v clawselfimprove >/dev/null 2>&1; then
  clawselfimprove learn "$LOG_MESSAGE"
else
  echo "ClawSelfImprove not found, logged locally."
fi
