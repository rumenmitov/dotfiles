#!/bin/fish
set strengthCheck $(iwgetid -r)
if test -n "$strengthCheck"
  nmcli -f SSID,BARS device wifi | grep -w $(iwgetid -r) | awk '{print $NF}'
else 
  echo "❓"
end
