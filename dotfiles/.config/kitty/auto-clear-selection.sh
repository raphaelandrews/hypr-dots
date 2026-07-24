#!/bin/bash
PIDFILE="${XDG_RUNTIME_DIR:-/tmp}/kitty-auto-clear-selection.pid"

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    exit 0
fi

echo $$ > "$PIDFILE"
trap "rm -f '$PIDFILE'" EXIT

USER_NAME="$USER"

clear_kitty_selection() {
    for sock in /tmp/kitty-"${USER_NAME}"-*; do
        [ -S "$sock" ] || continue
        kitten @ --to "unix:$sock" action clear_selection >/dev/null 2>&1 && break
    done
}

export -f clear_kitty_selection
export USER_NAME

wl-paste --watch bash -c 'clear_kitty_selection' &
wait $!