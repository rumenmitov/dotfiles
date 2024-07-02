source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/misc.zsh


setopt HIST_SAVE_NO_DUPS

bindkey -e

autoload -Uz compinit
compinit

_comp_options+=(globdots)

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*:default' list-colors \
                            ${(s.:.)LS_COLORS}


