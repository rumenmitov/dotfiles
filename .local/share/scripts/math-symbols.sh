#!/usr/bin/env bash

cat ~/.local/share/emojis/math.csv                                   \
    | dmenu                                                          \
    -i -l 4 -sb \#000000 -sf \#d000ff -fn 'Hack Nerd Font Mono 18'   \
    | awk '{print $1}'                                               \
    | tr -d \"\n\r\t\"                                               \
    | xclip -selection c
