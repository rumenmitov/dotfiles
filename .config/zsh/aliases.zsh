alias nv='nvim'
alias vim='SERVER=1 nvim'

lsd -V &>/dev/null && alias ls='lsd'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'

rip -V &>/dev/null && alias rm='rip'

systemctl &>/dev/null && alias sc='sudo systemctl'
systemctl &>/dev/null && alias s='systemctl --user'

alias dotfiles='git -C $HOME/.dotfiles'
