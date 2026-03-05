#!/usr/bin/env bash

wallpapersdir="$HOME/.local/share/wallpapers/Live"

wallpaper=$( ls "$wallpapersdir" | wofi --dmenu --prompt "🖼️" )

wallpaper_path="$wallpapersdir/$type/$wallpaper"

pkill mpvpaper
mpvpaper -s -o "no-audio --loop --panscan=1" ALL "$wallpaper_path" 
