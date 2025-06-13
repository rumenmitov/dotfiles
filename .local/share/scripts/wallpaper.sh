#!/usr/bin/env bash

wallpapersdir=$HOME/.local/share/wallpapers

if $(swww -V &>/dev/null); then
  type=$( echo -e "Static\nLive" | rofi -dmenu | awk '{print $1}' )

  if [ -z "$type" ]; then
    exit
  fi 

  wallpaper=$( ls "$wallpapersdir/$type/" | rofi -dmenu )

  wallpaper_path="$wallpapersdir/$type/$wallpaper"

  swww img "$wallpaper_path" 
else
  wallpaper=$( ls "$wallpapersdir/Static/" | dmenu -c -p "🖼️" )
  test -z $wallpaper && exit

  wallpaper_path="$wallpapersdir/Static/$wallpaper"

  feh --bg-scale "$wallpaper_path"
fi
