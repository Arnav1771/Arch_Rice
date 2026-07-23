#!/bin/bash
# Glassmorphic-style OSD notifications using Dunst

case $1 in
    volume_up)
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
        notify-send -h string:x-dunst-stack-tag:volume -h int:value:$vol "  Volume" "$vol%" -t 1500
        ;;
    volume_down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
        notify-send -h string:x-dunst-stack-tag:volume -h int:value:$vol "  Volume" "$vol%" -t 1500
        ;;
    volume_mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -i mute)
        if [ -n "$mute" ]; then
            notify-send -h string:x-dunst-stack-tag:volume -h int:value:0 "󰝟  Volume Muted" "0%" -t 1500
        else
            vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
            notify-send -h string:x-dunst-stack-tag:volume -h int:value:$vol "󰕾  Volume Unmuted" "$vol%" -t 1500
        fi
        ;;
    brightness_up)
        brightnessctl set 5%+
        bright=$(brightnessctl i | grep -oP '\(\K[0-9]+(?=%\))')
        notify-send -h string:x-dunst-stack-tag:brightness -h int:value:$bright "󰃠  Brightness" "$bright%" -t 1500
        ;;
    brightness_down)
        brightnessctl set 5%-
        bright=$(brightnessctl i | grep -oP '\(\K[0-9]+(?=%\))')
        notify-send -h string:x-dunst-stack-tag:brightness -h int:value:$bright "󰃞  Brightness" "$bright%" -t 1500
        ;;
esac
