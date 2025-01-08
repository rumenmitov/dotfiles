#!/usr/bin/env bash

while true; do
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    connected=$( cat /sys/class/power_supply/AC0/online )

    if [ $battery -le 15 ] && [ $connected != "Charging" ]; then 
        dunstify "Low Battery" "Battery is at 15%!" -u critical -I \
            "/home/rumen/.local/share/scripts/icons/low-battery.png"
    fi

    sleep 300
done
