function fish_prompt
	echo -n \n  
	echo -n (set_color blue)"$USER"(set_color white)"@$hostname"(set_color yellow) "★ " (set_color cyan)"$PWD"\n
	echo -n (set_color red)"➤ " (set_color normal)
end

# Git Prompt

	# Colors
	set -g green (set_color green)
	set -g magenta (set_color magenta)
	set -g normal (set_color normal)
	set -g red (set_color red)
	set -g yellow (set_color yellow)

	set -g __fish_git_prompt_color_dirtystate white
	set -g __fish_git_prompt_color_invalidstate red
	set -g __fish_git_prompt_color_merging yellow
	set -g __fish_git_prompt_color_stagedstate yellow
	set -g __fish_git_prompt_color_upstream_ahead green
	set -g __fish_git_prompt_color_upstream_behind red

  # Icons
  set -g __fish_git_prompt_char_cleanstate 🥳
  set -g __fish_git_prompt_char_dirtystate 🎱
  set -g __fish_git_prompt_char_untrackedfiles 🍿
  set -g __fish_git_prompt_char_stagedstate 🌟

function fish_right_prompt
	set -g __fish_git_prompt_show_informative_status true
	set -g __fish_git_prompt_use_informative_chars true
	set -g __fish_git_prompt_showcolorhints true
	set -g __fish_git_prompt_char_stateseparator "    "
	set -g __fish_git_prompt_showdirtystate true
	set -g __fish_git_prompt_showuntrackedfiles true
	set -g __fish_git_prompt_showupstream auto 

	# Potential functionality to get notified if branch is behind (too slow!)
	# if test -d .git
	#   git fetch > /dev/null
	# end

	printf "     %s" (fish_git_prompt '%s')
end

# Custom aliases
alias ls="logo-ls"
alias vimrc="vim ~/.vim/vimrc"
alias vim="nvim"
alias vimwiki="vim ~/Nextcloud/vimwiki/index.wiki"
alias stop="kill -9 $(lsof -i tcp:443 | grep LISTEN | awk '{print $2}')"
