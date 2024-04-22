source ~/.config/fish/utils/colors.fish
source ~/.config/fish/utils/git.fish
source ~/.config/fish/utils/prompt.fish
source ~/.config/fish/utils/aliases.fish

# Default Editor
    set -g EDITOR "$(which nvim)"

# Default ls Colors
    set -Ux LS_COLORS "*.py=33:di=34:*.h=35:*.pdf=4;37"
