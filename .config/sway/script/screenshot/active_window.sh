#/bin/bash

grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | tee ~/Pictures/screenshot/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy && notify-send "Screenshot saved!"
