#!/usr/bin/env bash

wallpapersdir="$HOME/.local/share/wallpapers/Static"

wallpaper=$( ls "$wallpapersdir"                                                      \
  | xargs -I{} printf "img:%s/%s\n" "$wallpapersdir" {}                               \
  | wofi --dmenu --columns 3                                                          \
    --style="${XDG_CONFIG_HOME:-$HOME/.config}/wofi/wallpaper-style.css"              \
    --define "x=50px"                                                                 \
    --define "y=25px"                                                                 \
    --define "width=1200px"                                                           \
    --define "height=800px"                                                           \
    --define "image_size=300"                                                         \
    --allow-images                                                                    \
  | awk -F: '{ print $NF }'                                                           \
  | xargs basename )

test -z "$wallpaper" && exit

wallpaper_path="$wallpapersdir/$wallpaper"

if [ -f /bin/mpvpaper ]; then
  pkill mpvpaper
fi

awww img -t none $wallpaper_path
