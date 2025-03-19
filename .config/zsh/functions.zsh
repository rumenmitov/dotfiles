function gac() {
    git add .
    git commit -S -m $1
}

function kpass() {
    local DB=$HOME/Nextcloud/other/passwords.kdbx
    local ENTRY=$(keepassxc-cli search $DB $1 | head -n 1)
    test -z $ENTRY || keepassxc-cli clip $DB $ENTRY
}
