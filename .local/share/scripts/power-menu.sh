# NOTE: Source is https://gist.github.com/mxdevmanuel/a2229d427b39a9e40f2198979caa40c1
op=$( echo -e " poweroff\n reboot\n suspend\n lock\n logout" | rofi -dmenu | awk '{print tolower($2)}' )

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
		        hyprlock
                ;;
        logout)
                hyprctl dispatch exit
                ;;
esac
