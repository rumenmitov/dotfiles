source "$HOME/.config/shell/env"

source $XDG_CONFIG_HOME/bash/colors.sh
source $XDG_CONFIG_HOME/bash/prompt.sh

export PATH=$PATH:$(pwd)/goa/bin
alias gdb=$HOME/Coding/phantomuserland/gdb-13.1/gdb/gdb

. "$HOME/.cargo/env"
