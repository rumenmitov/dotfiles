#!/usr/bin/env bash

greenclip print                                                    \
    | grep .                                                       \
    | dmenu                                                        \
    -i -l 4 -sb \#000000 -sf \#d000ff -fn 'Hack Nerd Font Mono 18' \
    | xargs -r -d'\n' -I '{}' greenclip print '{}'
