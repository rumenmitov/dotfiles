source $HOME/.config/bash/colors.sh
source /home/rumen/.config/bash/aliases.sh
source /home/rumen/.config/bash/environment.sh
source /home/rumen/.config/bash/prompt.sh

[ -f "/home/rumen/.ghcup/env" ] && . "/home/rumen/.ghcup/env" # ghcup-env
export PATH=$PATH:$(pwd)/goa/bin
alias gdb=$HOME/Coding/phantomuserland/gdb-13.1/gdb/gdb

. "$HOME/.cargo/env"
