#!/bin/bash
LAST=""
while true; do
    CURRENT=$(wl-paste -n 2>/dev/null)
    if [ "$CURRENT" != "$LAST" ] && [ -n "$CURRENT" ]; then
        PREVIEW=$(echo "$CURRENT" | head -c 120)
        [ "${#CURRENT}" -gt 120 ] && PREVIEW="${PREVIEW}..."
        notify-send -t 2000 -a "Clipboard" "📋 Copiado" "$PREVIEW"
        LAST="$CURRENT"
    fi
    sleep 0.3
done
