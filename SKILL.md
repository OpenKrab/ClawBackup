# ClawBackup Skill

ClawBackup is a lightweight, encrypted backup system for OpenClaw, designed to protect your critical data from loss. It automatically backs up important folders nightly, encrypts them with GPG, retains 7 days of versions, and notifies you via Telegram or Discord.

## Features
- **Automatic Nightly Backups**: Scheduled at 02:00 or your set time.
- **Selective Backup**: Only essential folders like workspaces, memories, skills, and configs.
- **End-to-End Encryption**: Uses GPG with your passphrase for security.
- **7-Day Retention**: Keeps 7 versions, auto-deletes older ones.
- **Local Storage**: No cloud; stores in ~/ClawBackups/ or your chosen location.
- **Notifications**: Short messages on success/failure.
- **Integration**: Works with ClawSelfImprove for logging and learning.

## Installation
Use ClawFlow for one-click install.

## Usage
- Backups run automatically.
- Restore manually: `clawbackup restore YYYYMMDD`
- Configure in config.yaml.

## Tech Stack
- Bash, tar, gpg
- Cron via OpenClaw scheduler
- Webhooks for notifications
