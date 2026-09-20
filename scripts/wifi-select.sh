#!/usr/bin/env bash
ssid="$1"; secured="$2"; active="$3"

if [ "$active" = "true" ]; then
    nmcli con down id "$ssid"
elif [ "$secured" = "true" ] && ! nmcli -t -f NAME con show | grep -qx "$ssid"; then
    eww update wifi_pass_ssid="$ssid"
    eww open wifi-password
    sleep 0.2
    xdotool search --name "Eww - wifi-password" windowactivate windowfocus
else
    nmcli dev wifi connect "$ssid"
fi
