set fish_path $HOME/.config/fish
set fish_greeting

set -g fish_prompt_pwd_dir_length 1

# Set favourite editor and pager
set -g -x VISUAL vim
set -g -x EDITOR vim
set -g -x PAGER less

. $fish_path/aliases.fish
. $fish_path/export.fish
. $fish_path/utils.fish

# fish_vi_mode
set fish_key_bindings fish_user_key_bindings


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


# Add SSH keys
# https://github.com/danhper/fish-ssh-agent
test_identities

# Activate AWS cli auto completion
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

zoxide init --cmd cd fish | source
