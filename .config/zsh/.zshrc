source $HOME/.zshenv
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/prompt.zsh

# History
setopt HIST_SAVE_NO_DUPS

# Auto-Correct
setopt CORRECT_ALL

# Editting command line
autoload -z edit-command-line
zle -N edit-command-line

bindkey -v
KEYTIMEOUT=1
bindkey '^x^e' edit-command-line


# Completion
autoload -Uz compinit
compinit 

_comp_options+=(globdots)

bindkey '^n' menu-complete
bindkey '^p' reverse-menu-complete

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*:default' list-colors \
                            ${(s.:.)LS_COLORS}

zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
