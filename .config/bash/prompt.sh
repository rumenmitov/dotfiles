function host_prompt() {
    if [[ $(git status 2>/dev/null) != "" ]]; then
        echo $red'  '$green$(git_prompt)' '
    else 
      echo "$cyan$(mail_prompt)\H"
    fi
}

function mail_prompt() {
    local maildir="$MAIL/INBOX/new"

    if [[ ! -d $maildir ]]; then
        echo "🏯"
        return
    fi
    
    local unread=$(ls -l $maildir | uniq | wc -l)
    [ $unread -gt 0 ] && echo "📩"
}

function git_prompt() {
    if [[ $(git status 2>/dev/null) != "" ]]; then
        echo -e '$(git branch --show-current)' \
            $reset'$(git_others_files) $(git_modified_files) $(git_deleted_files)'

    else
        echo ""
    fi
}

function git_deleted_files() {
    local number=$(git ls-files --deleted | uniq | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🗑️"
    fi
}

function git_modified_files() {
    local number=$(git ls-files --modified | uniq | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🛠️"
    fi

}

function git_others_files() {
    local number=$(git ls-files --others --exclude-standard | uniq | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🌱"
    fi
}

function bash_prompt() {
  PS1="$white\u$(host_prompt)$magenta  $underline_start\W$underline_end$reset » "
}

PROMPT_COMMAND=bash_prompt

