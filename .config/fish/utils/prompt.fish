function inNix
    if test -z "$IN_NIX_SHELL"
        echo "🦅"
    else 
        echo " "
    end
end


function fish_prompt
	echo -n \n  
	echo -n (set_color blue)"$USER"(set_color white)"🏯$hostname"(set_color yellow) "🌊" (set_color cyan)"$PWD"\n
	echo -n (set_color blue)"$(inNix) " (set_color normal)
end


function fish_right_prompt
	set -g __fish_git_prompt_show_informative_status true
	set -g __fish_git_prompt_use_informative_chars true
	set -g __fish_git_prompt_showcolorhints true
	set -g __fish_git_prompt_char_stateseparator "    "
	set -g __fish_git_prompt_showdirtystate true
	set -g __fish_git_prompt_showuntrackedfiles true
	set -g __fish_git_prompt_showupstream auto 

	printf "     %s" (fish_git_prompt '%s')
end
