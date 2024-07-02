wallpaper=$(ls "$HOME/.local/share/wallpapers/static/" | dmenu -i -l 4 -sb \#000000 -sf \#ff79c6)
wallpaper_path="$HOME/.local/share/wallpapers/static/$wallpaper"

nitrogen "$wallpaper_path" --set-zoom-fill --save
