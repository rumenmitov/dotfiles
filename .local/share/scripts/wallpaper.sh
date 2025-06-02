wallpaper=$( ls "$HOME/.local/share/wallpapers/Static/" | dmenu -c -p "🖼️" )
test -z $wallpaper && exit

wallpaper_path="$HOME/.local/share/wallpapers/Static/$wallpaper"

feh --bg-scale "$wallpaper_path"
