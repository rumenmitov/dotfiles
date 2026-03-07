function host_prompt() {
    if [[ $(git status 2>/dev/null) != "" ]]; then
        echo " %F{red}%f %F{green}$(git_prompt)%f"
    else 
        echo "%F{cyan}$(nix_shell)%m%f"
    fi
}

function mail_prompt() {
    local maildir="$MAIL/INBOX/new"

    [ -d $maildir ] || return
    
    local unread=$(ls -l $maildir | wc -l)
    [ $unread -gt 0 ] && echo "$unread📩"
}

function git_prompt() {
    if [[ $(git status 2>/dev/null) != "" ]]; then
        echo -e "$(git branch --show-current)" \
            "%F{white}$(git_others_files) $(git_modified_files) $(git_deleted_files)%f"

    else
        echo ""
    fi
}

function git_deleted_files() {
    local number=$(git ls-files --deleted | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🗑️"
    fi
}

function git_modified_files() {
    local number=$(git ls-files --modified | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🛠️"
    fi

}

function git_others_files() {
    local number=$(git ls-files --others --exclude-standard | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🌱"
    fi
}

function nix_shell() {
    local nix_path=$(echo $PATH | grep /nix/store)
    if [[ $IN_NIX_SHELL || $nix_path ]]; then
        echo " 󱄅 "
    else
        echo "@"
    fi
}

autoload -U promptinit && promptinit
setopt PROMPT_SUBST

VIMODE=""

function vi_mode_indicator () {
  case ${KEYMAP} in
    (vicmd)      echo "🔒" ;;
    (main|viins) echo "💬" ;;
    (*)          ;;
  esac
}

function zle-line-init zle-keymap-select() {
  VIMODE="$(vi_mode_indicator)"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd() {
    PS1='%F{white}%n$(host_prompt)%f%F{magenta}  %~%f $VIMODE%F{white}  '
    RPROMPT="$(mail_prompt)"
}
