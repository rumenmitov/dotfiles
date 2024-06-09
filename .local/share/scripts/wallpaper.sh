wallpaper=$(ls "$HOME/.local/share/wallpapers/static/" | rofi -dmenu -p 🖼️)
wallpaper_path="$HOME/.local/share/wallpapers/static/$wallpaper"

xwallpaper --zoom "$wallpaper_path"
xmonad --restart
