# NOTE: Source is https://gist.github.com/mxdevmanuel/a2229d427b39a9e40f2198979caa40c1
op=$( echo "  poweroff\n  reboot\n  suspend\n  lock\n  logout"    \
    | dmenu                                                          \
    -i -l 5 -sb \#000000 -sf \#d000ff -fn 'Hack Nerd Font Mono 18'   \
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
                ecryptfs-umount-private && pkill xmonad
                ;;
esac
