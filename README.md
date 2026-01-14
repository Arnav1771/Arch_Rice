# Dotfiles

My personal configuration files for Hyprland setup.

## 🖥️ System

- **OS**: Arch Linux
- **WM**: Hyprland
- **Bar**: Waybar
- **Terminal**: Kitty
- **Launcher**: Wofi
- **System Monitor**: btop

## 📁 Configs Included

- `hypr/` - Hyprland window manager configuration
- `waybar/` - Status bar configuration and styling
- `kitty/` - Terminal emulator settings
- `wofi/` - Application launcher
- `wlogout/` - Logout menu
- `btop/` - System monitor themes and config
- `gtk-3.0/` - GTK theme settings
- `mpv/` - Media player configuration
- `wal/` - Pywal color schemes

## 🚀 Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles

# Backup your existing configs
cp -r ~/.config ~/.config.backup

# Copy configs (or use GNU Stow)
cp -r * ~/.config/
```

## 📸 Screenshots

_Add your screenshots here_

## 🔧 Dependencies

List your main packages here, for example:
- hyprland
- waybar
- kitty
- wofi
- btop
- pywal (optional)

## 📝 Notes

- Some configs may need adjustment for your system (monitor names, paths, etc.)
- Check individual config files for customization options
