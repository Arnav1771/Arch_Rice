#!/usr/bin/env bash

set -euo pipefail

LOCK_SCRIPT="$HOME/.local/share/quickshell-lockscreen/lock.sh"
THEMES_ROOT="$HOME/.local/share/quickshell-lockscreen/themes_link"
BOOT_ID_FILE="/proc/sys/kernel/random/boot_id"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
CACHE_FILE="$CACHE_DIR/qylock-theme"

pick_random_theme() {
    local themes=()

    if [[ -d "$THEMES_ROOT" ]]; then
        mapfile -t themes < <(
            find "$THEMES_ROOT" -type f -name "Main.qml" \
                | sed -E "s|^$THEMES_ROOT/||; s|/Main.qml$||" \
                | sort
        )
    fi

    if [[ ${#themes[@]} -eq 0 ]]; then
        printf '%s\n' "nier-automata"
        return
    fi

    printf '%s\n' "${themes[RANDOM % ${#themes[@]}]}"
}

if [[ ! -x "$LOCK_SCRIPT" ]]; then
    notify-send "qylock" "Lock script not found: $LOCK_SCRIPT"
    exit 1
fi

boot_id="unknown"
[[ -r "$BOOT_ID_FILE" ]] && boot_id="$(<"$BOOT_ID_FILE")"

cached_boot=""
cached_theme=""
if [[ -f "$CACHE_FILE" ]]; then
    read -r cached_boot cached_theme < "$CACHE_FILE" || true
fi

if [[ "$cached_boot" == "$boot_id" && -n "$cached_theme" ]]; then
    QS_THEME="$cached_theme"
else
    QS_THEME="$(pick_random_theme)"
    mkdir -p "$CACHE_DIR"
    printf '%s %s\n' "$boot_id" "$QS_THEME" > "$CACHE_FILE"
fi

exec "$LOCK_SCRIPT" "$QS_THEME"