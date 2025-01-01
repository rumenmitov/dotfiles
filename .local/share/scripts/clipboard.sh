#!/usr/bin/env bash

greenclip print                                                    \
    | grep .                                                       \
    | dmenu                                                        \
    | xargs -r -d'\n' -I '{}' greenclip print '{}'
