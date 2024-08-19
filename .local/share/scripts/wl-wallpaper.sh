type=$( echo -e "Static\nLive" | rofi -dmenu | awk '{print tolower($1)}' )
wallpaper=$( ls "$HOME/.local/share/wallpapers/$type/" | rofi -dmenu )

wallpaper_path="$HOME/.local/share/wallpapers/$type/$wallpaper"

swww img "$wallpaper_path" 
