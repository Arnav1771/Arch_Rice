#!/bin/bash

entries="󰐥 Shutdown\n󰜉 Reboot\n󰤄 Suspend\n󰍃 Logout\n󰷛 Lock"

selected=$(echo -e $entries | wofi --dmenu --cache-file /dev/null --location 0 --width 250 --height 240 --style $HOME/.config/wofi/style.css --conf $HOME/.config/wofi/config --prompt "Power Menu")

case $selected in
  *Shutdown)
    systemctl poweroff ;;
  *Reboot)
    systemctl reboot ;;
  *Suspend)
    systemctl suspend ;;
  *Logout)
    hyprctl dispatch exit ;;
  *Lock)
    hyprlock ;;
esac