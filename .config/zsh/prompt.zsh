function host_prompt() {
    if [[ $(git status 2>/dev/null) != "" ]]; then
        echo " %F{202}%f %F{green}$(git_prompt)%f"
    else 
        echo "%F{45}$(nix_shell)%m%f"
    fi
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
    local number=$(git ls-files --others | wc -l)
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

function precmd() {
    PS1="%F{white}%n$(host_prompt)%f%F{201}  %~%f%F{green}%f »%F{white}  "
}
