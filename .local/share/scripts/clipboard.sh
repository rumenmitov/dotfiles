#!/usr/bin/env bash

if cliphist version &>/dev/null; then
  cliphist list                                                               \
    | rofi -i -dmenu -display-columns 2 -p "📄" --width "400" --height "500"  \
    | cliphist decode                                                         \
    | wl-copy
else
  greenclip print                                                  \
    | grep .                                                       \
    | dmenu -p "📋"                                                \
    | xargs -r -d'\n' -I '{}' greenclip print '{}'
fi
