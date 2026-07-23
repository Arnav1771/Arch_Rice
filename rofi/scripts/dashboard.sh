#!/bin/bash

## Epic Control Center Dashboard

# Options
lock="󰌾  Lock"
suspend="󰤄  Sleep"
logout="󰍃  Logout"
reboot="󰜉  Reboot"
shutdown="󰐥  Shutdown"
wallpaper="󰸉  Change Wallpaper"
reload="󰑐  Reload UI"

# Pass options to rofi
options="$wallpaper\n$reload\n$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -i -p "⚡ Keqing Center" -theme ~/.config/rofi/clipboard.rasi)"

case $chosen in
    $lock)
        hyprlock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        hyprctl dispatch exit
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff
        ;;
    $wallpaper)
        bash ~/.config/hypr/scripts/theme-switcher.sh
        ;;
    $reload)
        hyprctl reload && killall waybar; waybar &
        ;;
esac
