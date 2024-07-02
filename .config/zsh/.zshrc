source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/misc.zsh


# History
setopt HIST_SAVE_NO_DUPS


# Keybinds
autoload -z edit-command-line
zle -N edit-command-line

bindkey -e
bindkey '^x' edit-command-line


# Completion
autoload -Uz compinit
compinit

_comp_options+=(globdots)

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*:default' list-colors \
                            ${(s.:.)LS_COLORS}


# Plugins
# source 
