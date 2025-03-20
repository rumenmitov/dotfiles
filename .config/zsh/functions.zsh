function gac() {
    git add .
    git commit -S -m $1
}

function kpass() {
    local DB=$HOME/Nextcloud/other/passwords.kdbx
    keepassxc-cli clip --best-match $DB $1 0
}
