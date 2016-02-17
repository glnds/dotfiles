set fish_path $HOME/.config/fish
set fish_greeting

 # Set favourite editor and pager
 set --universal --export VISUAL "vim -f"
 set --universal --export EDITOR $VISUAL
 set --universal PAGER 'less'
 
. $fish_path/aliases.fish
. $fish_path/export.fish
. $fish_path/utils.fish

# fish_vi_mode
set fish_key_bindings fish_user_key_bindings

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


# SSH Agent
# http://www.maxbucknell.com/blog/2015/5/5/ssh-identities
#
# Start SSH Agent if it's not already running, and add the
# id_(hostname) identity.
setenv SSH_ENV "$HOME/.ssh/environment"
if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

#archey -c
