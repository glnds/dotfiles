set -g -x PATH /usr/local/bin $PATH

#h git prompt
#
#
#
#
set -g __fish_git_prompt_showupstream informative verbose
#set -g __fish_git_prompt_show_informative_status 1
#set -g __fish_git_prompt_showupstream 1
set -g __fish_git_prompt_showuntrackedfiles 1
#set -g __fish_git_prompt_showdirtystate 1
#set -g __fish_git_prompt_showstashstate 1
#set -g __fish_git_prompt_showcolorhints 1
#
#
#
#set __fish_git_prompt_showupstream 'yes'
#set __fish_git_prompt_color_branch yellow
#set __fish_git_prompt_color_upstream_ahead green
#set __fish_git_prompt_color_upstream_behind red

# Status Chars
#set __fish_git_prompt_char_dirtystate '⚡'
#set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '  ☡'
#set __fish_git_prompt_char_stashstate '↩'
#set __fish_git_prompt_char_upstream_ahead '+'
#set __fish_git_prompt_char_upstream_behind '-'
