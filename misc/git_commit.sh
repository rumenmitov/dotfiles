#!/bin/bash

GREEN="\e[32m"
PURPLE="\e[95m"
BOLD_ENDCOLOR="\e[1;97m"

echo -en "$GREEN Commit Message $PURPLE👉  $BOLD_ENDCOLOR"
read -r msg
git commit -m "$msg"
