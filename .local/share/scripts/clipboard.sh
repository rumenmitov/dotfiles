#!/usr/bin/env bash

if cliphist version &>/dev/null; then
  cliphist list                                                               \
    | awk '{ $1=""; print substr($0, 2) }' \
    | wofi --dmenu --prompt "📄"   \
    | cliphist decode                                                         \
    | wl-copy
else
  greenclip print                                                  \
    | grep .                                                       \
    | dmenu -p "📋"                                                \
    | xargs -r -d'\n' -I '{}' greenclip print '{}'
fi
