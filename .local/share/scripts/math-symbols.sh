#!/usr/bin/env bash

cat ~/.local/share/emojis/math.csv                                   \
    | dmenu -p "Symbol:"                                             \
    | awk '{print $1}'                                               \
    | tr -d "\\n\\r\\t"                                              \
    | xclip -selection c
