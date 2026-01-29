#!/usr/bin/env bash

symbolfile=$HOME/.local/share/emojis/math.csv 

if $(wl-copy -v &>/dev/null); then
  cat $symbolfile                             \
    | wofi --dmenu                          \
    | awk '{print $1}'                        \
    | tr -d "\n"                              \
    | wl-copy
else
  cat $symbolfile                                                      \
    | dmenu -p "Symbol:"                                             \
    | awk '{print $1}'                                               \
    | tr -d "\\n\\r\\t"                                              \
    | xclip -selection c
fi
