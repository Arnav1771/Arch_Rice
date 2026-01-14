#!/bin/bash
# Epic Hyprland Keybindings Overlay

# Get Pywal colors if available, fallback to purple theme
if [ -f ~/.cache/wal/colors.sh ]; then
    source ~/.cache/wal/colors.sh
    BG="$color0"
    FG="$color7"
    ACCENT="$color5"
    DIM="$color8"
else
    BG="#1e1e2e"
    FG="#cdd6f4"
    ACCENT="#ca9ee6"
    DIM="#6c7086"
fi

# Create styled cheatsheet
kitty \
    --class="keybinds-float" \
    --title="⌨  Keybindings" \
    -o background="$BG" \
    -o foreground="$FG" \
    -o background_opacity=0.95 \
    -o font_size=11 \
    --hold \
    sh -c "cat << 'EOF'

$(tput setaf 5)╔═══════════════════════════════════════════════════════════════════╗
║               ⌨  HYPRLAND KEYBINDINGS CHEATSHEET                  ║
╚═══════════════════════════════════════════════════════════════════╝$(tput sgr0)

$(tput bold)$(tput setaf 6)┏━━ 🚀 APPLICATIONS ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(tput sgr0)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)Enter$(tput sgr0)          →  Terminal (Kitty)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)E$(tput sgr0)              →  File Manager (Dolphin)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)B$(tput sgr0)              →  Browser (Firefox)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)C$(tput sgr0)              →  Code Editor
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)D$(tput sgr0)              →  Discord
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)T$(tput sgr0)              →  Theme Switcher
$(tput bold)$(tput setaf 6)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(tput sgr0)

$(tput bold)$(tput setaf 2)┏━━ 🪟 WINDOW MANAGEMENT ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(tput sgr0)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)Q$(tput sgr0)              →  Kill Active Window
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)F$(tput sgr0)              →  Toggle Floating
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)M$(tput sgr0)              →  Fullscreen (Maximize)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)S$(tput sgr0)              →  Toggle Split Direction
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)P$(tput sgr0)              →  Pseudo Tile
$(tput bold)$(tput setaf 2)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(tput sgr0)

$(tput bold)$(tput setaf 4)┏━━ 🧭 NAVIGATION ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(tput sgr0)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)←/→/↑/↓$(tput sgr0)        →  Focus Window (Directional)
  $(tput setaf 5)Super Shift$(tput sgr0) + $(tput setaf 3)←/→/↑/↓$(tput sgr0)  →  Move Window
  $(tput setaf 5)Super Ctrl$(tput sgr0) + $(tput setaf 3)←/→/↑/↓$(tput sgr0)   →  Resize Window (±30px)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)1..0$(tput sgr0)           →  Switch to Workspace 1-10
  $(tput setaf 5)Super Shift$(tput sgr0) + $(tput setaf 3)1..0$(tput sgr0)     →  Move Window to Workspace
$(tput bold)$(tput setaf 4)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(tput sgr0)

$(tput bold)$(tput setaf 1)┏━━ 🖱  MOUSE ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(tput sgr0)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)Left Drag$(tput sgr0)      →  Move Window
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)Right Drag$(tput sgr0)     →  Resize Window
$(tput bold)$(tput setaf 1)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(tput sgr0)

$(tput bold)$(tput setaf 3)┏━━ ⚙  SYSTEM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(tput sgr0)
  $(tput setaf 5)Super$(tput sgr0) + $(tput setaf 3)L$(tput sgr0)              →  Lock Screen (Hyprlock)
  $(tput setaf 5)Super Shift$(tput sgr0) + $(tput setaf 3)W$(tput sgr0)        →  Random Wallpaper
  $(tput setaf 5)Super Shift$(tput sgr0) + $(tput setaf 3)Q$(tput sgr0)        →  Exit Hyprland
  $(tput setaf 3)XF86AudioRaise/Lower$(tput sgr0)  →  Volume ±5%
  $(tput setaf 3)XF86MonBrightness±$(tput sgr0)    →  Brightness ±5%
$(tput bold)$(tput setaf 3)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(tput sgr0)

$(tput bold)$(tput setaf 5)┏━━ ℹ️  INFO ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓$(tput sgr0)
  $(tput setaf 5)Super Ctrl$(tput sgr0) + $(tput setaf 3)K$(tput sgr0)         →  Show This Cheatsheet
$(tput bold)$(tput setaf 5)┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛$(tput sgr0)

$(tput dim)Press Ctrl+D or close window to exit$(tput sgr0)
EOF
; exec bash --norc -i"
