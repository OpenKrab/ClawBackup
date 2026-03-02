#!/bin/bash

MESSAGE="$1"
CONFIG_FILE="$(dirname "$0")/../config.yaml"
TELEGRAM_WEBHOOK=$(grep 'telegram_webhook:' "$CONFIG_FILE" | cut -d':' -f2 | xargs)
DISCORD_WEBHOOK=$(grep 'discord_webhook:' "$CONFIG_FILE" | cut -d':' -f2 | xargs)

if [ -n "$TELEGRAM_WEBHOOK" ]; then
  curl -X POST "$TELEGRAM_WEBHOOK" -H "Content-Type: application/json" -d "{\"text\":\"$MESSAGE\"}"
fi

if [ -n "$DISCORD_WEBHOOK" ]; then
  curl -X POST "$DISCORD_WEBHOOK" -H "Content-Type: application/json" -d "{\"content\":\"$MESSAGE\"}"
fi
