#!/bin/bash
# ============================================================
# ⚡ KEQING ELECTRO — CHEATSHEET DISPLAY SCRIPT
# Run directly by kitty. No heredocs, no nesting.
# ============================================================

# Load pywal colors or fall back to electro purple
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    source "$HOME/.cache/wal/colors.sh"
fi

# ANSI colors — use pywal if available, else electro defaults
R=$'\033[0m'
BOLD=$'\033[1m'
DIM=$'\033[2m'

# Foreground colors via RGB
pu=$'\033[38;2;202;158;230m'   # Purple (electro)
go=$'\033[38;2;249;226;175m'   # Gold
gr=$'\033[38;2;166;227;161m'   # Green
cy=$'\033[38;2;148;226;213m'   # Cyan
bl=$'\033[38;2;137;180;250m'   # Blue
rd=$'\033[38;2;243;139;168m'   # Red
wh=$'\033[38;2;205;214;244m'   # White/fg
dm=$'\033[38;2;108;112;134m'   # Dim grey

clear

echo ""
echo -e "  ${pu}${BOLD}╔══════════════════════════════════════════════════════════════════════════════════════════════════════════╗${R}"
echo -e "  ${pu}${BOLD}║              ⚡  K E Q I N G   E L E C T R O  ──  S Y S T E M   S H O R T C U T S  ⚡                 ║${R}"
echo -e "  ${pu}${BOLD}╚══════════════════════════════════════════════════════════════════════════════════════════════════════════╝${R}"
echo ""

# ── ROW 1 ──────────────────────────────────────────────────────────────────────
echo -e "  ${go}${BOLD}┌───────────────────────────────────┐   ┌───────────────────────────────────┐   ┌──────────────────────────────────┐${R}"
echo -e "  ${go}${BOLD}│        🚀  APPLICATIONS           │   │      🪟  WINDOW MANAGEMENT        │   │       🧭  WORKSPACES             │${R}"
echo -e "  ${go}${BOLD}└───────────────────────────────────┘   └───────────────────────────────────┘   └──────────────────────────────────┘${R}"
echo -e "  ${pu}Super${R} + ${go}Enter${R}     → ${wh}Terminal (Kitty)${R}       ${pu}Super${R} + ${go}Q${R}          → ${rd}Kill Window${R}            ${pu}Super${R} + ${go}1-0${R}      → ${wh}Switch Workspace${R}"
echo -e "  ${pu}Super${R} + ${go}E${R}         → ${wh}File Manager (Yazi)${R}    ${pu}Super${R} + ${go}F${R}          → ${cy}Toggle Float${R}           ${pu}Super⇧${R} + ${go}1-0${R}    → ${wh}Move Win→Workspace${R}"
echo -e "  ${pu}Super${R} + ${go}B${R}         → ${wh}Firefox${R}                ${pu}Super${R} + ${go}M${R}          → ${cy}Fullscreen${R}             ${pu}Super${R} + ${go}↑↓←→${R}     → ${wh}Focus Window${R}"
echo -e "  ${pu}Super${R} + ${go}C${R}         → ${wh}VS Code${R}                ${pu}Super${R} + ${go}P${R}          → ${cy}Pseudo Tile${R}            ${pu}Super⇧${R} + ${go}↑↓←→${R}   → ${wh}Move Window${R}"
echo -e "  ${pu}Super${R} + ${go}D${R}         → ${wh}Discord${R}                ${pu}Super⇧${R} + ${go}Q${R}        → ${rd}Exit Hyprland${R}          ${pu}Super⌃${R} + ${go}↑↓←→${R}   → ${wh}Resize ±30px${R}"
echo -e "  ${pu}Super${R} + ${go}O${R}         → ${wh}Obsidian${R}               ${pu}Super${R} + ${go}LMB drag${R}  → ${cy}Move Float${R}"
echo -e "  ${pu}Super⇧${R} + ${go}O${R}        → ${wh}OBS Studio${R}             ${pu}Super${R} + ${go}RMB drag${R}  → ${cy}Resize Float${R}"
echo -e "  ${pu}Super${R} + ${go}P${R}         → ${wh}Spotify${R}"
echo ""

# ── ROW 2 ──────────────────────────────────────────────────────────────────────
echo -e "  ${gr}${BOLD}┌───────────────────────────────────┐   ┌───────────────────────────────────┐   ┌──────────────────────────────────┐${R}"
echo -e "  ${gr}${BOLD}│       ⚙  SYSTEM & LOCK            │   │      🎨  THEME & DISPLAY          │   │      🎵  MEDIA & VOLUME          │${R}"
echo -e "  ${gr}${BOLD}└───────────────────────────────────┘   └───────────────────────────────────┘   └──────────────────────────────────┘${R}"
echo -e "  ${pu}Super${R} + ${go}L${R}         → ${wh}Lock Screen (hyprlock)${R} ${pu}Super${R} + ${go}T${R}          → ${cy}Electro Theme Picker${R}   ${dm}XF86AudioRaiseVol${R}  → ${wh}Volume +5%${R}"
echo -e "  ${pu}Super${R} + ${go}/${R}         → ${wh}This Cheatsheet${R}        ${pu}Super⇧${R} + ${go}W${R}        → ${cy}Random Wallpaper${R}       ${dm}XF86AudioLowerVol${R}  → ${wh}Volume -5%${R}"
echo -e "  ${dm}Idle 3 min${R}       → ${wh}Screen dim${R}             ${dm}(rofi picker → awww + pywal)${R}          ${dm}XF86AudioMute${R}      → ${wh}Toggle Mute${R}"
echo -e "  ${dm}Idle 5 min${R}       → ${wh}Lock screen${R}            ${dm}Auto-recolors: Waybar, Kitty,${R}         ${dm}XF86BrightnessUp${R}   → ${wh}Brightness +5%${R}"
echo -e "  ${dm}Idle 15 min${R}      → ${wh}Suspend${R}                ${dm}Yazi, Firefox, Obsidian, OBS${R}          ${dm}XF86BrightnessDown${R} → ${wh}Brightness -5%${R}"
echo ""

# ── ROW 3 ──────────────────────────────────────────────────────────────────────
echo -e "  ${bl}${BOLD}┌───────────────────────────────────┐   ┌───────────────────────────────────┐   ┌──────────────────────────────────┐${R}"
echo -e "  ${bl}${BOLD}│      📂  YAZI FILE MANAGER        │   │      📊  WAYBAR INTERACTIONS      │   │      🔋  POWER MENU  ⏻          │${R}"
echo -e "  ${bl}${BOLD}└───────────────────────────────────┘   └───────────────────────────────────┘   └──────────────────────────────────┘${R}"
echo -e "  ${go}h j k l${R}          → ${wh}Navigate (vim-style)${R}   ${cy}Click Clock${R}       → ${wh}Toggle Date${R}           ${gr}󰐥 Shutdown${R}       → ${wh}systemctl poweroff${R}"
echo -e "  ${go}Enter / l${R}        → ${wh}Open / Enter dir${R}       ${cy}Hover Clock${R}       → ${wh}Calendar popup${R}        ${gr}󰜉 Reboot${R}         → ${wh}systemctl reboot${R}"
echo -e "  ${go}.${R}                → ${wh}Toggle hidden files${R}    ${cy}Click Network${R}     → ${wh}nm-connection-editor${R}  ${gr}󰤄 Suspend${R}        → ${wh}systemctl suspend${R}"
echo -e "  ${go}y / x / p${R}        → ${wh}Copy / Cut / Paste${R}    ${cy}Click Volume${R}      → ${wh}pavucontrol${R}           ${gr}󰍃 Logout${R}         → ${wh}hyprctl exit${R}"
echo -e "  ${go}r${R}                → ${wh}Rename file${R}            ${cy}Mid-click Vol${R}     → ${wh}Toggle mute${R}           ${gr}󰷛 Lock${R}           → ${wh}hyprlock${R}"
echo -e "  ${go}a${R}                → ${wh}Create file / dir${R}      ${cy}Scroll Brightness${R} → ${wh}Bright ±1%${R}"
echo -e "  ${go}d${R}                → ${wh}Move to trash${R}          ${cy}Click Bluetooth${R}   → ${wh}kitty bluetoothctl${R}"
echo -e "  ${go}/${R}                → ${wh}Find in dir${R}            ${cy}Click CPU/RAM${R}     → ${wh}kitty btop${R}"
echo -e "  ${go}F${R}                → ${wh}fd fuzzy search${R}        ${cy}Click Media${R}       → ${wh}Play / Pause${R}"
echo -e "  ${go}gh / gP / gr${R}     → ${wh}Home / Projects / Rice${R} ${cy}Right-click Media${R} → ${wh}Next track${R}"
echo -e "  ${go}q${R}                → ${wh}Quit + cd to dir${R}"
echo ""
echo -e "  ${pu}${BOLD}══════════════════════════════════════════════════════════════════════════════════════════════════════════${R}"
echo -e "  ${dm}                              Press  ${R}${rd}${BOLD}Q${R}  ${dm}or${R}  ${rd}${BOLD}Ctrl+C${R}  ${dm}to close this overlay${R}"
echo -e "  ${pu}${BOLD}══════════════════════════════════════════════════════════════════════════════════════════════════════════${R}"
echo ""

# Wait for any key then exit
read -rsn1
