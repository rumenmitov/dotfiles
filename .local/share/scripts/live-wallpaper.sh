#!/usr/bin/env bash

wallpapersdir="$HOME/.local/share/wallpapers/Live"

wallpaper=$( ls "$wallpapersdir" | wofi --dmenu )

[ -z "$wallpaper" ] && exit 1

wallpaper_path="$wallpapersdir/$wallpaper"

pkill mpvpaper
mpvpaper -s -o "no-audio --loop --panscan=1" ALL "$wallpaper_path" 
