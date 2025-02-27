#!/bin/bash

# Set the font and size for the clock and date
FONT="monospace"
FONTSIZE=30

# Get the current time and date
TIME=$(date +"%H:%M")
DATE=$(date +"%A, %d %B %Y")
i3lock \
  --time-str="$TIME" \
  --date-str="$DATE" \
  --clock \
  --indicator

# Run swaylock with the time and date displayed in the circle
swaylock \
  --indicator \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  --clock \
  --timestr "$TIME" \ 
--datestr "$DATE" \
  --font "$FONT" \
  --font-size "$FONTSIZE" \
  --inside-color 00000088 \
  --ring-color 000000cc \
  --line-color 00000000 \
  --key-hl-color ffffff88 \
  --text-color ffffff88 \
  --inside-ver-color 00000088 \
  --inside-wrong-color 00000088 \
  --ring-ver-color 000000cc \
  --ring-wrong-color ff0000cc
