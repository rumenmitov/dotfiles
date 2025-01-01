#!/usr/bin/env zsh

cat ~/.local/share/emojis/emojis.csv                                 \
    | dmenu                                                          \
    -i -l 4 -sb \#000000 -sf \#d000ff -fn 'xft:CaskaydiaCove Nerd Font:pixelsize=24:antialias=true:autohint=true'   \
    | awk '{print $1}'                                               \
    | tr -d "\\n\\r\\t"                                              \
    | xclip -selection c
