wallpaper=$(ls "$HOME/.local/share/wallpapers/static/" | rofi -dmenu -p 🖼️)
wallpaper_path="$HOME/.local/share/wallpapers/static/$wallpaper"

nitrogen "$wallpaper_path" --set-zoom-fill --save
