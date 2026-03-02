# 🦞 ClawBackup

ClawBackup is a lightweight, encrypted backup system for OpenClaw, protecting your critical data from loss. It automatically backs up workspaces, memories, skills, and configs nightly, encrypts with GPG, retains 7 days, and notifies via Telegram/Discord.

## Features
- **Automatic Nightly Backups**: Cron-triggered at 02:00 or custom time.
- **Selective & Smart Backup**: Only essential folders (no full system dump).
- **End-to-End Encryption**: GPG AES-256 with your passphrase.
- **7-Day Rolling Retention**: Auto-deletes older backups.
- **Local-Only Storage**: No cloud; uses ~/ClawBackups/ or custom path.
- **Bilingual Notifications**: Short messages in English and Thai.
- **ClawSelfImprove Integration**: Logs for learning from backup events.
- **Emergency Restore**: One-command restore with confirmation.

```
backup_dir: ~/ClawBackups/
retention_days: 7
```

```
✅ ClawBackup completed
Size: 47 MB
Version: 20260302
Retained for 7 days
```

## Backup Flow
```
flowchart TD
A([Cron Trigger]) --> B[Collect Folders]
B --> C[Tar + GPG Encrypt]
C --> D[Store Backup File]
D --> E[Rotate Old Backups]
E --> F[Send Notification]
F --> G[Post-Backup Hook]
G --> H[Log to ClawSelfImprove]
```

## Getting Started
### Prerequisites
- Linux/Mac/Windows (with WSL for Windows)
- GPG installed (`apt install gpg` or similar)
- OpenClaw CLI (for integration)

### Installation
1. Install via ClawFlow:
   ```
   clawflow install openkrab/claw-backup
   ```

2. Set GPG passphrase (prompted once).

3. Configure folders in `config.yaml` if needed.

4. Backups run automatically; test with `./scripts/backup.sh`.

## Core Commands
### Backup
Run manually:
```
./scripts/backup.sh
```

### Restore
List backups:
```
./scripts/restore.sh list
```

Restore specific version:
```
./scripts/restore.sh restore 20260301-0200
```

### Notify
Send test notification:
```
./scripts/notify.sh "Test message"
```

## Notifications
Configure webhooks in `config.yaml`:
```
telegram_webhook: "https://api.telegram.org/bot..."
discord_webhook: "https://discord.com/api/webhooks/..."
```

Messages include size, version, retention status.

## Hooks
Post-backup script logs events for ClawSelfImprove learning.

## Project Structure
```
claw-backup/
├── SKILL.md
├── README.md
├── ClawFlow.yaml
├── config.yaml
├── scripts/
│   ├── backup.sh
│   ├── notify.sh
│   └── restore.sh
├── hooks/
│   └── post-backup.sh
└── examples/
    └── restore-example.md
```

## Contributing
- Fork and PR.
- Test on your setup.

## About
Resources: [OpenKrab](https://github.com/OpenKrab)

Stars: ⭐ Watchers: 👀 Forks: 🍴