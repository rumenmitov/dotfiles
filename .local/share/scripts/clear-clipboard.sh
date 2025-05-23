#!/usr/bin/env bash

xclip -sel clip /dev/null
pkill greenclip
greenclip clear 
greenclip daemon &
disown
