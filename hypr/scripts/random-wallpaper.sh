#!/bin/bash
# ⚡ random-wallpaper.sh
# SUPER+SHIFT+W — picks a random wallpaper, applies pywal, syncs borders + waybar

WALL_DIR="$HOME/.config/hypr/wallpapers"

# Pick a random wallpaper
wallpaper=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

[ -z "$wallpaper" ] && exit 1

# Set wallpaper with awww transition
awww img "$wallpaper" \
    --transition-type grow \
    --transition-pos center \
    --transition-duration 1.5

# Generate pywal palette
wal -i "$wallpaper" -n -q

# Regenerate Yazi theme
bash "$HOME/.config/yazi/generate-yazi-theme.sh"

# ⚡ Sync Hyprland border colors from fresh pywal palette
source "$HOME/.cache/wal/colors.sh"
c5="${color5//#/}"
c4="${color4//#/}"
c8="${color8//#/}"
hyprctl keyword general:col.active_border   "rgba(${c5}ff) rgba(${c4}ff) 45deg"
hyprctl keyword general:col.inactive_border "rgba(${c8}44)"

# Reload Waybar colors
killall -SIGUSR2 waybar

# Reload Kitty colors
kill -SIGUSR1 $(pidof kitty) 2>/dev/null || true
