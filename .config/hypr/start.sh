#!/usr/bin/env bash

# initialize wallpaper daemon
swww-daemon &

# set wallpaper
swww img /home/emm/Pictures/wallpaper1.png &

nm-applet --indicator &

waybar &

mako &

#hyprctl setcursor Bibata-Modern-Classic 24
