wallpaper=$( ls "$HOME/.local/share/wallpapers/static/" |          \
    dmenu                                                          \
    -i -l 4 -sb \#000000 -sf \#d000ff -fn 'Hack Nerd Font Mono 18'

wallpaper_path="$HOME/.local/share/wallpapers/static/$wallpaper"

nitrogen "$wallpaper_path" --set-zoom-fill --save
