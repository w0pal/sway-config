#!/bin/bash

# Directory to store clipboard images
CLIPBOARD_DIR="$HOME/.cache/clipboard-images"
mkdir -p "$CLIPBOARD_DIR"

# Save current clipboard image
wl-paste -t image/png >"$CLIPBOARD_DIR/$(date +%s).png"

# List images and select one using rofi
SELECTED_IMAGE=$(ls "$CLIPBOARD_DIR" | rofi -dmenu -p "Select Image" -format d)

# Copy selected image back to clipboard
if [ -n "$SELECTED_IMAGE" ]; then
  cat "$CLIPBOARD_DIR/$SELECTED_IMAGE" | wl-copy
fi
