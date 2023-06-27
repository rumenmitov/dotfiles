#!/bin/bash

GREEN="\e[32m"
PURPLE="\e[95m"
ENDCOLOR="\e[0m"

echo -en "$GREEN Commit Message $PURPLE👉  $ENDCOLOR"
read -r msg
git commit -m "$msg"
