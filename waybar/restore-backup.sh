#!/bin/bash
# Quick restore script for Waybar backups

BACKUP_DIR="$HOME/.config/waybar/backups"

echo "Available Waybar backups:"
echo "========================="
ls -lht "$BACKUP_DIR" | grep -E "config|style" | nl

echo ""
read -p "Enter the timestamp to restore (e.g., 20260109-202651) or 'latest' for most recent: " choice

if [ "$choice" = "latest" ]; then
    config_backup=$(ls -t "$BACKUP_DIR"/config.jsonc.backup-* 2>/dev/null | head -1)
    style_backup=$(ls -t "$BACKUP_DIR"/style.css.backup-* 2>/dev/null | head -1)
else
    config_backup="$BACKUP_DIR/config.jsonc.backup-$choice"
    style_backup="$BACKUP_DIR/style.css.backup-$choice"
fi

if [ ! -f "$config_backup" ] || [ ! -f "$style_backup" ]; then
    echo "Error: Backup files not found!"
    exit 1
fi

echo "Restoring from backup..."
cp "$config_backup" "$HOME/.config/waybar/config.jsonc"
cp "$style_backup" "$HOME/.config/waybar/style.css"

echo "Restarting Waybar..."
killall waybar
waybar &

echo "✓ Waybar restored successfully!"
