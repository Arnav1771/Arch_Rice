#!/bin/bash
# Find listening TCP ports on the machine (for devs)

# Extract ports, sort unique, join with comma
PORTS=$(ss -tlnH | awk '{print $4}' | grep -Eo '[0-9]+$' | sort -un | tr '\n' ',' | sed 's/,$//')

if [ -n "$PORTS" ]; then
    # Return JSON for waybar
    echo "{\"text\":\" $PORTS\", \"tooltip\":\"Listening Ports:\n$PORTS\"}"
else
    echo "{\"text\":\"\", \"tooltip\":\"No active listening ports\"}"
fi
