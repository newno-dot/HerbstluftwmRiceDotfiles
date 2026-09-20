#!/usr/bin/env bash

wallpaper_dir="$HOME/.sS/wallpaper"

selected=$(find "$wallpaper_dir" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) \
    | while read -r img; do
        printf "%s\x00icon\x1f%s\n" "$(basename "$img")" "$img"
      done \
    | rofi -dmenu -i -p "Wallpaper" -show-icons \
        -theme ~/.config/rofi/night-street-wallpapers.rasi)

[ -n "$selected" ] && feh --bg-fill "$wallpaper_dir/$selected"
