export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export TERM=screen-256color

export EDITOR="nvim"
export VISUAL="nvim"

export HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
export HISTSIZE=10000 
export SAVEHIST=10000

export LS_COLORS="*.py=33:di=34:*.h=35:*.pdf=4;37:ex=32"

. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
