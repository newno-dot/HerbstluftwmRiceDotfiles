#!/usr/bin/env bash
ssid="$1"; pass="$2"
if [ -n "$pass" ]; then
    nmcli dev wifi connect "$ssid" password "$pass"
else
    nmcli dev wifi connect "$ssid"
fi
