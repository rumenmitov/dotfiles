source "$HOME/.config/shell/env"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
export HISTSIZE=10000 
export SAVEHIST=10000

zoxide --version >/dev/null && eval "$(zoxide init zsh)"
. "$HOME/.cargo/env"
