#!/bin/bash

CONFIG_FILE="$(dirname "$0")/../config.yaml"
BACKUP_DIR=$(grep 'backup_dir:' "$CONFIG_FILE" | cut -d':' -f2 | xargs)
PASSPHRASE=$(grep 'gpg_passphrase:' "$CONFIG_FILE" | cut -d':' -f2 | xargs)

if [ "$1" = "list" ]; then
  echo "Available backups:"
  ls -1 "$BACKUP_DIR"/claw-backup-*.tar.gpg | sed 's/.*claw-backup-//' | sed 's/\.tar\.gpg//' | sort -r
elif [ "$1" = "restore" ] && [ -n "$2" ]; then
  DATE="$2"
  BACKUP_FILE="$BACKUP_DIR/claw-backup-$DATE.tar.gpg"
  if [ ! -f "$BACKUP_FILE" ]; then
    echo "Backup file not found: $BACKUP_FILE"
    exit 1
  fi
  echo "Restoring from $BACKUP_FILE"
  read -p "This will overwrite existing files. Continue? (y/N): " confirm
  if [ "$confirm" != "y" ]; then
    echo "Restore cancelled."
    exit 0
  fi
  gpg --batch --yes --passphrase "$PASSPHRASE" --decrypt "$BACKUP_FILE" | tar -xzf -
  echo "Restore completed."
else
  echo "Usage: $0 list | restore YYYYMMDD-HHMM"
fi
