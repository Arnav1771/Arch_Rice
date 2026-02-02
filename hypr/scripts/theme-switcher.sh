#!/bin/bash
WALL_DIR="$HOME/.config/hypr/wallpapers/"

# This picks Keqing1.jpg and generates the purple/gold palette
selected_wall=$(ls "$WALL_DIR" | rofi -dmenu -p "󰉼 Electro-System")

if [ -n "$selected_wall" ]; then
    swww img "$WALL_DIR/$selected_wall" --transition-type grow
    wal -i "$WALL_DIR/$selected_wall" -n
    killall waybar && waybar &
    # Forces Kitty to refresh with Keqing's colors
    kill -SIGUSR1 $(pidof kitty)
    
    # Apply theme to Obsidian
    mkdir -p "$HOME/Obsidian Vault/.obsidian/snippets"
    
    # Read colors from pywal
    bg=$(cat ~/.cache/wal/colors.json | jq -r '.special.background')
    fg=$(cat ~/.cache/wal/colors.json | jq -r '.special.foreground')
    c1=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color1')
    c2=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color2')
    c3=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color3')
    c4=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color4')
    c5=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color5')
    c6=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color6')
    c8=$(cat ~/.cache/wal/colors.json | jq -r '.colors.color8')
    
    # Convert hex to rgba for semi-transparency
    bg_rgb=$(printf "%d, %d, %d" 0x${bg:1:2} 0x${bg:3:2} 0x${bg:5:2})
    c8_rgb=$(printf "%d, %d, %d" 0x${c8:1:2} 0x${c8:3:2} 0x${c8:5:2})
    
    cat > "$HOME/Obsidian Vault/.obsidian/snippets/pywal.css" << OBSEOF
/* Pywal Auto-Generated Theme */
.theme-dark {
    --background-primary: $bg;
    --background-primary-alt: $bg;
    --background-secondary: $c1;
    --background-secondary-alt: $c8;
    --background-modifier-border: $c8;
    --background-modifier-form-field: rgba($bg_rgb, 0.4);
    --background-modifier-form-field-highlighted: rgba($c8_rgb, 0.3);
    --text-accent: $c5;
    --text-accent-hover: $c6;
    --text-normal: $fg;
    --text-muted: $c8;
    --text-faint: $c8;
    --text-highlight-bg: $c3;
    --text-highlight-bg-active: $c4;
    --interactive-normal: $c8;
    --interactive-hover: $c3;
    --interactive-accent: $c4;
    --interactive-accent-hover: $c5;
}

/* Editor text area with semi-transparency */
.cm-content,
.cm-line {
    color: $fg !important;
}

.cm-editor .cm-scroller,
.markdown-source-view.mod-cm6 .cm-scroller {
    background: rgba($bg_rgb, 0.4) !important;
}

.cm-editor {
    background: rgba($bg_rgb, 0.4) !important;
}

/* Ensure cursor is visible */
.cm-cursor, .cm-cursor-primary {
    border-left-color: $c5 !important;
}
OBSEOF
    
    # Apply theme to OBS Studio
    mkdir -p "$HOME/.config/obs-studio/themes"
    cat > "$HOME/.config/obs-studio/themes/Pywal.obt" << OBSEOF
/* Pywal OBS Theme */
:root {
    --primary: $c4;
    --primary_light: $c5;
    --bg_base: $bg;
    --bg_window: $c8;
    --text: $fg;
    --text_muted: $c8;
    --button_bg: $c4;
    --button_bg_hover: $c5;
    --button_bg_down: $c3;
    --border_color: $c8;
    --list_item_bg_selected: $c4;
    --list_item_bg_hover: $c3;
}
QPushButton { background: var(--button_bg); color: var(--text); border: 1px solid var(--border_color); padding: 6px 12px; border-radius: 4px; }
QPushButton:hover { background: var(--button_bg_hover); }
QListWidget, QTreeView { background: var(--bg_base); border: 1px solid var(--border_color); color: var(--text); }
QListWidget::item:selected { background: var(--list_item_bg_selected); }
QMenuBar { background: var(--bg_base); color: var(--text); }
OBSEOF

    # Apply theme to Firefox
    FIREFOX_PROFILE=$(find ~/.config/mozilla/firefox ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default-release" 2>/dev/null | head -1)
    if [ -n "$FIREFOX_PROFILE" ]; then
        mkdir -p "$FIREFOX_PROFILE/chrome"
        cat > "$FIREFOX_PROFILE/chrome/userChrome.css" << FFEOF
/* Pywal Firefox Theme - Auto Generated */
@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

:root {
    --pywal-bg: $bg;
    --pywal-fg: $fg;
    --pywal-c1: $c1;
    --pywal-c2: $c2;
    --pywal-c3: $c3;
    --pywal-c4: $c4;
    --pywal-c5: $c5;
    --pywal-c6: $c6;
    --pywal-c8: $c8;
}

/* Main toolbar */
#navigator-toolbox {
    background: var(--pywal-bg) !important;
    border-bottom: 1px solid var(--pywal-c8) !important;
}

/* URL bar */
#urlbar-background {
    background: var(--pywal-c1) !important;
    border: 1px solid var(--pywal-c8) !important;
}

#urlbar-input {
    color: var(--pywal-fg) !important;
}

/* Tabs */
.tab-background {
    background: var(--pywal-bg) !important;
}

.tab-background[selected="true"] {
    background: var(--pywal-c4) !important;
}

.tabbrowser-tab:hover .tab-background:not([selected="true"]) {
    background: var(--pywal-c3) !important;
}

.tab-text {
    color: var(--pywal-fg) !important;
}

/* Tab bar */
#TabsToolbar {
    background: var(--pywal-bg) !important;
}

/* Sidebar */
#sidebar-box {
    background: var(--pywal-bg) !important;
}

/* Bookmarks toolbar */
#PersonalToolbar {
    background: var(--pywal-bg) !important;
}

toolbarbutton {
    color: var(--pywal-fg) !important;
}

/* Menu popup */
menupopup {
    background: var(--pywal-bg) !important;
    color: var(--pywal-fg) !important;
}

menuitem:hover {
    background: var(--pywal-c4) !important;
}
FFEOF

        # Also create userContent.css for web pages (new tab, etc)
        cat > "$FIREFOX_PROFILE/chrome/userContent.css" << FFCEOF
/* Pywal Firefox Content Theme - Transparent New Tab with Wallpaper */
@-moz-document url("about:home"), url("about:newtab"), url("about:privatebrowsing") {
    body {
        background: url("file://$WALL_DIR/$selected_wall") no-repeat center center fixed !important;
        background-size: cover !important;
    }
    
    body::before {
        content: "";
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(${bg_rgb}, 0.7) !important;
        z-index: -1;
    }
    
    /* Search box styling */
    .search-wrapper input,
    .search-handoff-button {
        background-color: rgba(${bg_rgb}, 0.8) !important;
        color: $fg !important;
        border: 1px solid $c4 !important;
        backdrop-filter: blur(10px);
    }
    
    /* Logo */
    .logo-and-wordmark {
        filter: drop-shadow(0 0 10px $c4);
    }
    
    /* Top sites cards */
    .top-site-outer .tile {
        background-color: rgba(${bg_rgb}, 0.7) !important;
        backdrop-filter: blur(5px);
    }
    
    .top-site-outer:hover .tile {
        background-color: rgba(${c4:1:6}, 0.5) !important;
    }
    
    /* Section titles */
    .section-title span {
        color: $fg !important;
    }
    
    /* Cards */
    .card-outer {
        background: rgba(${bg_rgb}, 0.6) !important;
        backdrop-filter: blur(5px);
    }
}

@-moz-document url-prefix("about:") {
    :root {
        --in-content-page-background: transparent !important;
        --in-content-page-color: $fg !important;
    }
}
FFCEOF
        echo "Firefox theme applied! Restart Firefox to see changes."
    fi
fi