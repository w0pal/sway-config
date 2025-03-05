#/bin/bash

grim - | tee ~/Pictures/screenshot/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy && notify-send "Screenshot saved!"
