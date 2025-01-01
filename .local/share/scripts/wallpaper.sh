wallpaper=$( ls "$HOME/.local/share/wallpapers/Static/" | dmenu )

wallpaper_path="$HOME/.local/share/wallpapers/Static/$wallpaper"

feh --bg-scale "$wallpaper_path"
