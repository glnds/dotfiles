set fish_path $HOME/.config/fish

set fish_greeting

set -g fish_prompt_pwd_dir_length 1

# Set favourite editor and pager
set -g -x VISUAL nvim
set -g -x EDITOR nvim
set -g -x PAGER less

. $fish_path/aliases.fish
. $fish_path/export.fish
. $fish_path/utils.fish
test -f $fish_path/secrets.fish && . $fish_path/secrets.fish

# fish_vi_mode
set fish_key_bindings fish_user_key_bindings

# Activate AWS cli auto completion
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

zoxide init --cmd cd fish | source

fzf --fish | source

atuin init fish | source

direnv hook fish | source

starship init fish | source

# Auto-start tmux in Alacritty
if status is-interactive
    and test "$TERM" = alacritty
    and not set -q TMUX
    tmux new-session -As main
end

# Sync AWS_PROFILE to tmux status bar
if set -q TMUX; and set -q AWS_PROFILE
    tmux set-option -g @aws-profile "$AWS_PROFILE"
end
