function host_prompt() {
    if [[ $(git status 2>/dev/null) != "" ]]; then
        echo $red'  '$green$(git_prompt)' '
    else 
        echo $blue'🥷\H🏯'
    fi
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
    local number=$(git ls-files --others | wc -l)
    if [[ $number == 0 ]]; then 
        echo ""
    else 
        echo " $number🌱"
    fi
}

function bash_prompt() {
    PS1=$white'\u'$(host_prompt)$purple'  '$underline_start'\W'$underline_end$green' »'$reset'  '
}

PROMPT_COMMAND=bash_prompt

