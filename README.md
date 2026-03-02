# ClawBackup

ClawBackup automatically backs up your critical OpenClaw data nightly, encrypted and secure. Fear losing your workspaces, memories, skills, or configs? This skill has you covered.

## Quick Start
1. Install via ClawFlow: `clawflow install openkrab/claw-backup`
2. Set passphrase once.
3. Backups run at 02:00 daily.

## Features
- Encrypted with GPG (AES-256)
- 7-day rolling retention
- Local storage only
- Telegram/Discord notifications
- Integrates with ClawSelfImprove

## Restore Commands
- List backups: `clawbackup list`
- Restore specific date: `clawbackup restore 20260301`
- Confirm overwrite before restoring.

## Demo
![Demo GIF](demo.gif)  // Placeholder for GIF

Backups take ~38 seconds for 47 MB.