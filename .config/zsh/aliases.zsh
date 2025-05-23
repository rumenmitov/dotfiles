alias nv='nvim'
alias vim='SERVER=1 nvim'

lsd -V &>/dev/null && alias ls='lsd'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'

bat -V &>/dev/null && alias less='bat'

rip -V &>/dev/null && alias rm='rip'

systemctl &>/dev/null && alias sc='sudo systemctl'
systemctl &>/dev/null && alias s='systemctl --user'

alias dotfiles='git -C $HOME/.dotfiles'
ollama -v &>/dev/null && alias commander='ollama run commander'
