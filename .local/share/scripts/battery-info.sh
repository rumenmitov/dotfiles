#!/bin/sh

REM=$(acpi -b | awk '{ print $5 " "  $6 }')

dunstify $REM --raw_icon="$HOME/.local/share/scripts/icons/battery.png"
