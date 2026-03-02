# Restore Example

To restore your ClawBackup:

1. List available backups:
   ```
   ./scripts/restore.sh list
   ```

2. Choose a date, e.g., 20260301-0200

3. Run restore:
   ```
   ./scripts/restore.sh restore 20260301-0200
   ```

4. Confirm overwrite when prompted.

Note: Ensure GPG passphrase is set in config.yaml.
