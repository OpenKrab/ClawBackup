#!/bin/bash

set -e

CONFIG_FILE="$(dirname "$0")/../config.yaml"
BACKUP_DIR=$(grep 'backup_dir:' "$CONFIG_FILE" | cut -d':' -f2 | xargs)
FOLDERS=$(grep -A 10 'backup_folders:' "$CONFIG_FILE" | tail -n +2 | grep '^  -' | sed 's/  - //')
PASSPHRASE=$(grep 'gpg_passphrase:' "$CONFIG_FILE" | cut -d':' -f2 | xargs)

DATE=$(date +%Y%m%d-%H%M)
BACKUP_FILE="$BACKUP_DIR/claw-backup-$DATE.tar.gpg"

mkdir -p "$BACKUP_DIR"

# Collect files into tar and encrypt
tar -czf - $FOLDERS | gpg --batch --yes --passphrase "$PASSPHRASE" --symmetric --output "$BACKUP_FILE"

# Rotate old backups
find "$BACKUP_DIR" -name "claw-backup-*.tar.gpg" -mtime +7 -delete

# Calculate size and notify
SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
VERSION=$(date +%Y%m%d)
MESSAGE="✅ ClawBackup completed
Size: $SIZE
Version: $VERSION
Retained for 7 days

"$(dirname "$0")/notify.sh" "$MESSAGE"

# Post-backup hook for ClawSelfImprove
"$(dirname "$0")/../hooks/post-backup.sh" "Backup successful: size $SIZE, version $VERSION"

echo "Backup completed: $BACKUP_FILE"
