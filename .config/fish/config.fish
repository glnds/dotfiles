set fish_path $HOME/.config/fish
set fish_greeting
 
. $fish_path/aliases.fish
. $fish_path/export.fish
. $fish_path/utils.fish

# set -gx RBENV_ROOT /usr/local/var/rbenv  
# . (rbenv init -|psub)
# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1
#. (rbenv init -)

eval (python -m virtualfish)

# git prompt
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
set -g __fish_git_prompt_showupstream verbose
#set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showcolorhints 1

set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

#archey -c
