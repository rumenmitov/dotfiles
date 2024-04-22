alias nv="nvim"
alias stop="kill -9 $(lsof -i tcp:443 | grep LISTEN | awk '{print $2}')"
alias tty-clock=" tty-clock -c -B -C 6"
alias gac="git add . && git commit -m"

