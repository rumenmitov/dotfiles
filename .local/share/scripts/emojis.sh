#!/usr/bin/env bash

emojifile=$HOME/.local/share/emojis/emojis.csv 

if $(wl-copy -v &>/dev/null); then
  cat  $emojifile                       \
    | rofi -i -dmenu                    \
    | awk '{print $1}'                  \
    | tr -d "\n"                        \
    | wl-copy
else
  cat $emojifile                                                        \
    | dmenu -p "Emoji:"                                                 \
    | awk '{print $1}'                                                  \
    | tr -d "\\n\\r\\t"                                                 \
    | xclip -selection c
fi
