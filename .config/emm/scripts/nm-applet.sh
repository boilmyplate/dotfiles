#!/usr/bin/env bash

if [[ "$1" == "stop" ]]; then
    pkill nm-applet
elif [[ "$1" == "toggle" ]]; then
    if pgrep "nm-applet" >/dev/null; then
        echo "Running"
        pkill nm-applet
    else
        echo "Stopped"
        nm-applet --indicator &
    fi
else
    nm-applet --indicator &
fi
