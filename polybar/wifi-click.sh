#!/bin/fish
nmcli dev wifi list | awk 'NR!=1' | awk '{print $2,$3,$4,$5,$11}' | xargs -0 notify-send WiFi
