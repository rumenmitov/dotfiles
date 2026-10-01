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

# Keybinds
stty -ixon

bindkey -e
EDIT_MODE="emacs" # needed for prompt.zsh (set to either "emacs" or "vi")

KEYTIMEOUT=1

bindkey "^?" backward-delete-char
bindkey '^x^e' edit-command-line

bindkey -r '^xg'
bindkey -s '^xga' 'git add .'
bindkey -s '^xgc' 'git commit -m ""\e[D' # NOTE \e[D is left-arrow
bindkey -s '^xgp' 'git push'

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Completion
autoload -Uz compinit
compinit 

_comp_options+=(globdots)

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*:default' list-colors \
                            ${(s.:.)LS_COLORS}

zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
