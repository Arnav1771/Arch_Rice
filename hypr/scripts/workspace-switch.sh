#!/bin/bash
# ==========================================================
# EPIC WORKSPACE SWITCHER - Random Transitions
# ==========================================================

WORKSPACE=$1

# Epic transitions array
TRANSITIONS=(
    "slide"
    "slidevert"
    "fade"
    "slidefade"
    "slidefadevert"
)

# Epic beziers
BEZIERS=(
    "0.05, 0.9, 0.1, 1.05"      # snap
    "0.16, 1, 0.3, 1"           # easeOutExpo
    "0.34, 1.56, 0.64, 1"       # easeOutBack (bounce)
    "0.68, -0.55, 0.27, 1.55"   # easeInOutBack
    "0.87, 0, 0.13, 1"          # easeInOutCubic
)

# Random selection
RAND_TRANS=${TRANSITIONS[$RANDOM % ${#TRANSITIONS[@]}]}
RAND_BEZIER=${BEZIERS[$RANDOM % ${#BEZIERS[@]}]}
RAND_SPEED=$((3 + RANDOM % 4))  # Speed between 3-6

# Apply random animation
hyprctl keyword animation "workspaces, 1, $RAND_SPEED, default, $RAND_TRANS"

# Switch workspace
hyprctl dispatch workspace "$WORKSPACE"
