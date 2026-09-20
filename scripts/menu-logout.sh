#!/usr/bin/env bash

options="   Lock\n  󰍃 Logout\n   Reboot\n   Shutdown\n  󰒲 Suspend"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power" \
    -theme ~/.config/rofi/night-street-logout.rasi)

case "$chosen" in
    *Lock*)     betterlockscreen -l || i3lock ;;
    *Logout*)   herbstclient quit ;;
    *Reboot*)   systemctl reboot ;;
    *Shutdown*) systemctl poweroff ;;
    *Suspend*)  systemctl suspend ;;
esac
