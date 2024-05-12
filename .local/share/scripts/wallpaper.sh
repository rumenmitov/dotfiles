wallpaper=$(ls "$HOME/.local/share/wallpapers" | rofi -dmenu -p 🖼️)
wallpaper_path="$HOME/.local/share/wallpapers/$wallpaper"

xwallpaper --zoom "$wallpaper_path"
