alias ..="cd .."

# set AWS profile environment variable (also syncs to tmux status line)
function setaws
    if test (count $argv) -eq 0
        set -e AWS_PROFILE
        if set -q TMUX
            tmux set-option -gu @aws-profile
        end
    else
        set -x -g AWS_PROFILE $argv[1]
        if set -q TMUX
            tmux set-option -g @aws-profile "$argv[1]"
        end
    end
end
alias awswho='aws sts get-caller-identity'

# Use the trash can
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
# Quick config
alias ea='nvim ~/.config/fish/aliases.fish'
alias ef='nvim ~/.config/fish/config.fish'
alias eg='nvim ~/.gitconfig'
alias et='nvim ~/.tmux.conf'

# Search hidden files by default
alias rg='rg --hidden'

# Clear screen
alias c='clear'

# Go to...
alias D='cd ~/Downloads'
alias blog='cd ~/Documents/Projects/Blog/Blog\ WIP/'
alias sb='cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/My\ Second Mind'
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias g='git'
alias vim='nvim'
alias ob='obsidian'
alias fvim='vim (fzf)'

# Yazi file manager (cd to last dir on exit)
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- $tmp); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    trash "$tmp"
end

alias markdownlint-cli2='markdownlint-cli2 --config ~/.markdownlint.yaml'

# git related shortcut
alias undopush="git push -f origin HEAD^:master"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias grm="git rm"
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gcr!='git commit -v --amend --no-edit'
alias gbd="git branch -D"
alias gst="git status -sb --ignore-submodules --show-stash"
alias gm="git merge --no-ff"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gp="git push"
alias gptg="git push --tags"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git log"
alias glp="git log --pretty=format:'%h - %an, %ar : %s'"
alias gpom="git pull origin master"
alias glup="git log origin/master..HEAD"
alias gr="git remote -v"
alias glr="git ls-remote"
alias glg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gs="git stash"
alias gsl="git stash list"
function gss
    git stash show -p stash@\{$argv[1]\}
end
alias gsal="git stash apply"
function gsa
    git stash apply stash@\{$argv[1]\}
end
function gsd
    git stash drop stash@\{$argv[1]\}
end

alias tig=gitui
alias lg='lazygit'

# turn on coloring on grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Quick check running state of a process
alias psef="ps -ef | grep "
alias top="btop"
alias ps="command ps -SAcr -o 'uid,pid,ppid,time,rss,command'"

# Docker
alias dk="docker"
alias dkls="docker ps -a"
alias dkrm='docker rm (docker ps -a -q)'
alias dkrmi="docker rmi (docker images -q)"
alias dkrcentos="docker run -it --rm --name centos7 -h centos -v /data centos:7 /bin/bash"

# Ansible
alias ap='ansible-playbook'
alias aga='ansible-galaxy'

# Terraform
alias tf='terraform'
alias tfgi='terraform graph | dot -Tpng > graph.png'

# Claude Code
alias cc='claude --allow-dangerously-skip-permissions'
alias ccc='claude --continue --allow-dangerously-skip-permissions'
alias ccr='claude --resume --allow-dangerously-skip-permissions'
alias fcc='claude-foundry --allow-dangerously-skip-permissions'
alias fccc='claude-foundry --continue --allow-dangerously-skip-permissions'
alias fccr='claude-foundry --resume --allow-dangerously-skip-permissions'
alias dcc='claude-dpg-seat --allow-dangerously-skip-permissions'
alias dccc='claude-dpg-seat --continue --allow-dangerously-skip-permissions'
alias dccr='claude-dpg-seat --resume --allow-dangerously-skip-permissions'

# Tmux
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t 0"
alias tmk="tmux kill-session -t 0"

# Kubernetes
alias kn="kubectl"
# Google Cloud
alias gcl="gcloud"

function lockme
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

function update
    brew update
    brew upgrade
    brew cleanup
    uv tool upgrade --all
end

alias python=python3

# http://osxnotes.net/spotlight.html
alias spotlight="mdfind"

alias vimdiff="vim -d"

alias weather="curl -4 wttr.in/Grimbergen"
alias moon="curl -4 wttr.in/Moon"

alias wnas="wakeonlan 00:11:32:45:3b:01"

# CLI Tools
alias cat="bat"
alias find="fd"
alias du="dust"
alias ls="eza"
alias ll="eza -lh"
alias la="eza -lhaa"
alias lsami="aws ec2 describe-images --query 'Images[*].[Tags[?Key==`Name`].Value|[0],Name,ImageId,State,CreationDate]' --filters Name=image-type,Values=machine Name=is-public,Values=false --output table --region eu-west-1"
alias s3ls="aws s3api list-buckets --query 'Buckets[*].[Name]' --output table --region eu-west-1"
alias efsls="aws efs describe-file-systems --query 'FileSystems[*].[Name,FileSystemId]' --output table --region eu-west-1"
alias vpcls='aws ec2 describe-vpcs --query "Vpcs[*].{Name:Tags[?Key==`Name`].Value|[0],Squad:Tags[?Key==`Squad`].Value|[0],ID:VpcId,CIDR:CidrBlock,DHCP:DhcpOptionsId,State:State}" --filter "Name=isDefault,Values=false" --output table --region eu-west-1'
