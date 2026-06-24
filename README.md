# ⚡ Keqing Electro — Arch Linux Hyprland Rice

> *"Opportunity, here I come!"* — 刻晴

A fully themed Hyprland desktop environment with dynamic pywal color theming, electro purple/gold aesthetic, and a complete workflow setup.

---

## 🖥️ System Info

| Component | Tool |
|---|---|
| **OS** | Arch Linux x86_64 |
| **Kernel** | Linux 6.x (rolling) |
| **WM / Compositor** | [Hyprland](https://hyprland.org/) v0.55+ (Wayland) |
| **Bar** | [Waybar](https://github.com/Alexays/Waybar) |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| **Shell** | Zsh + Oh My Zsh |
| **File Manager** | [Yazi](https://github.com/sxyazi/yazi) (in Kitty) |
| **App Launcher** | Wofi |
| **Wallpaper Daemon** | [awww](https://github.com/ful1e5/awww) |
| **Color Theming** | [pywal](https://github.com/dylanaraps/pywal) |
| **Lock Screen** | [hyprlock](https://github.com/hyprwm/hyprlock) |
| **Idle Daemon** | [hypridle](https://github.com/hyprwm/hypridle) |
| **Notification Daemon** | — (planned: mako) |
| **System Monitor** | [btop](https://github.com/aristocratos/btop) |
| **Logout Menu** | Wofi power menu |
| **Media Control** | playerctl + Waybar MPRIS |
| **Bluetooth GUI** | [blueman](https://github.com/blueman-project/blueman) |
| **GPU** | NVIDIA GTX 1650 Mobile + Intel UHD (hybrid) |
| **Fonts** | JetBrainsMono Nerd Font |

---

## 📁 Config Structure

```
Arch_Rice/
├── hypr/
│   ├── hyprland.conf          # Main Hyprland config
│   ├── hyprlock.conf          # Lock screen config
│   ├── pyprland.toml          # Pyprland plugins (expose)
│   └── scripts/
│       ├── theme-switcher.sh      # Rofi wallpaper picker + full pywal pipeline
│       ├── random-wallpaper.sh    # SUPER+SHIFT+W random wallpaper
│       ├── workspace-switch.sh    # Random workspace transition animations
│       ├── power-menu.sh          # Wofi shutdown/reboot/lock menu
│       ├── cheatsheet.sh          # SUPER+/ fullscreen shortcut overlay
│       ├── keybinds.sh            # Keybind reference in terminal
│       └── qylock-lock.sh         # Hyprlock wrapper
├── waybar/
│   ├── config.jsonc           # Waybar module config
│   └── style.css              # Waybar CSS (electro theme)
├── kitty/
│   └── kitty.conf             # Terminal config
├── btop/
│   └── btop.conf              # System monitor theme
├── wofi/                      # App launcher styles
├── wlogout/                   # Logout screen
├── mpv/                       # Media player config
└── wal/                       # Pywal color templates
```

---

## ⚡ Features

- **Dynamic pywal theming** — switch wallpaper → entire desktop recolors (Waybar, Kitty, Yazi, borders, Firefox, Obsidian)
- **Live border sync** — Hyprland window borders update to match wallpaper colors via `hyprctl keyword`
- **Electro aesthetic** — Purple/gold Keqing-inspired color scheme as base
- **Yazi file manager** — Vim-keybinds, inline image previews in Kitty, pywal-themed
- **Waybar modules** — Workspaces, MPRIS now-playing, Clock, Network, Bluetooth (blueman GUI), CPU, CPU Temp, RAM, Brightness, Volume, Battery, Power
- **Fullscreen cheatsheet** — `SUPER+/` shows all keybinds as a fullscreen overlay
- **Workspace animations** — Random bezier/transition per workspace switch
- **NVIDIA + Wayland** — Properly configured env vars for hybrid GPU setup

---

## ⌨️ Key Shortcuts

| Key | Action |
|---|---|
| `SUPER + Enter` | Terminal (Kitty) |
| `SUPER + E` | File Manager (Yazi) |
| `SUPER + T` | Wallpaper picker + theme switch |
| `SUPER + SHIFT + W` | Random wallpaper |
| `SUPER + /` | Fullscreen shortcut cheatsheet |
| `SUPER + L` | Lock screen |
| `SUPER + B` | Firefox |
| `SUPER + C` | VS Code |
| `SUPER + D` | Discord |
| `SUPER + P` | Spotify |
| `SUPER + Q` | Kill window |
| `SUPER + F` | Toggle float |
| `SUPER + M` | Fullscreen |
| `SUPER + 1-0` | Switch workspace |

---

## 📦 Dependencies

```bash
# Core
hyprland hyprlock hypridle pyprland

# Bar
waybar

# Terminal + Shell
kitty zsh oh-my-zsh

# Wallpaper + Theming
awww pywal

# File Manager
yazi ffmpegthumbnailer fd

# Launcher / Menus
wofi rofi

# Bluetooth
blueman

# Media
playerctl mpv spotify

# System
btop brightnessctl pipewire wireplumber
nvidia-dkms nvidia-utils nvidia-settings

# Fonts
ttf-jetbrains-mono-nerd
```

---

## 🚀 Setup

```bash
# Clone
git clone https://github.com/Arnav1771/Arch_Rice.git ~/Downloads/Arch_Rice

# Symlink to ~/.config (what this repo does)
# configs are symlinked so edits here reflect live

# Add the dots alias to your .zshrc for easy git management:
echo 'alias dots="git -C ~/Downloads/Arch_Rice"' >> ~/.zshrc

# Push changes from anywhere:
dots add .
dots commit -m "your message"
dots push
```

---

## 📝 Notes

- Monitor config in `hyprland.conf` uses `monitor=,preferred,auto,1` — change for your output name
- NVIDIA env vars are set for GTX 1650 — remove if using AMD/Intel only
- Pywal templates live in `wal/` — Firefox and Obsidian CSS auto-generated on theme switch
- `awww-daemon` must be running for wallpapers to work (`exec-once = awww-daemon` in hyprland.conf)
