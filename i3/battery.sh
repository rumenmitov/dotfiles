#!/bin/fish
while true
  set battery $(cat /sys/class/power_supply/BAT0/capacity)
  if test "$battery" -lt 15 
    notify-send -u critical -t 2000 "Battery Low🪫" "Please charge!"
    break 
  end
end
