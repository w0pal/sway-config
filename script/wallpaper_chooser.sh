#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper/"
CACHE_WALLPAPER="$HOME/.config/sway/wallpaper/cache.jpg"

# Pilih wallpaper menggunakan rofi
#SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | rofi -dmenu -i -p "Select Wallpaper")
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | while read -r file; do
  echo -en "$file\x00icon\x1f$file\n"
done | rofi -dmenu -i -p "Select Wallpaper" -format "s")

if [ -n "$SELECTED_WALLPAPER" ]; then
  # Tampilkan preview menggunakan feh
  feh --bg-fill "$SELECTED_WALLPAPER"

  # Set wallpaper di sway
  swaymsg output "*" bg "$SELECTED_WALLPAPER" fill

  # Simpan wallpaper sebagai cache.jpg
  cp "$SELECTED_WALLPAPER" "$CACHE_WALLPAPER"
fi
