#!/usr/bin/env bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
connected=$( cat /sys/class/power_supply/AC0/online )

if [ $battery -le 15 ] && [ $connected -eq 0 ]; then 
  dunstify "Low Battery" "Battery is at $battery%!" -u critical -I \
    "$HOME/.local/share/scripts/icons/low-battery.png"
fi

