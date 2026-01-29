#!/usr/bin/env bash

wallpapersdir=$HOME/.local/share/wallpapers

if [ -f /bin/mpvpaper ]; then
  type=$( echo -e "Static\nLive" | wofi --dmenu | awk '{print $1}' )

  if [ -z "$type" ]; then
    exit
  fi 

  wallpaper=$( ls "$wallpapersdir/$type/" | wofi --dmenu )

  wallpaper_path="$wallpapersdir/$type/$wallpaper"


  if [ -f /bin/swww ] && [ $type == "Static" ]; then
    swww img -t none $wallpaper_path
    pkill mpvpaper
  else 
    pkill mpvpaper
    mpvpaper -s -o "no-audio --loop --panscan=1" ALL "$wallpaper_path" 
  fi
else
  wallpaper=$( ls "$wallpapersdir/Static/" | dmenu -c -p "🖼️" )
  test -z $wallpaper && exit

  wallpaper_path="$wallpapersdir/Static/$wallpaper"

  feh --bg-scale "$wallpaper_path"
fi
