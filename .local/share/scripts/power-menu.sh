#!/usr/bin/env bash

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
  op=$( echo -e " poweroff\n reboot\n suspend\n lock\n logout"    \
    | rofi -dmenu                                                      \
    | awk '{print tolower($2)}' )

  case $op in 
    poweroff)
      poweroff -i
      ;;
    reboot)
      reboot -i
      ;;
    suspend)
      systemctl "$op"
      ;;
    lock)
      sleep 1 &&
        exec hyprlock
      ;;
    logout)
      hyprctl dispatch exit || pkill dwl
      ;;
  esac
else
  op=$( echo "  poweroff\n  reboot\n  suspend\n  lock\n  logout"     \
    | dmenu -c -p ">"                                                     \
    | awk '{print tolower($2)}' )

  case $op in 
    poweroff)
      loginctl poweroff -i
      ;;
    reboot)
      loginctl reboot -i
      ;;
    suspend)
      systemctl "$op"
      ;;
    lock)
      i3lock -c 000000
      ;;
    logout)
      loginctl kill-user $USER
      ;;
  esac
fi
