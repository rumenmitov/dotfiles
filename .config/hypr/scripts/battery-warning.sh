while true; do
    battery=$(cat /sys/class/power_supply/BAT0/capacity)

    if [[ $battery -le 15 ]]; then 
        dunstify "Low Battery" "Battery is at 15%!" -u critical -I "/home/rumen/.config/hypr/assets/icons/low-battery.png"
    fi

    sleep 300
done
