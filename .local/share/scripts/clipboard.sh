#!/usr/bin/env bash

if cliphist version &>/dev/null; then
  cliphist list \
    | wofi -S dmenu --prompt "📋" \
    | cliphist decode \
    | wl-copy
else
  greenclip print                                                  \
    | grep .                                                       \
    | dmenu -p "📋"                                                \
    | xargs -r -d'\n' -I '{}' greenclip print '{}'
fi
