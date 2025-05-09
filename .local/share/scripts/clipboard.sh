#!/usr/bin/env bash

greenclip print                                                    \
    | grep .                                                       \
    | dmenu -p "📋"                                                \
    | xargs -r -d'\n' -I '{}' greenclip print '{}'
