alias ..="cd .."

# set AWS profile environment variable
alias setaws='set -x -g AWS_PROFILE'

# Use the trash can
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"
#alias pip="echo Use 'pip2' or 'pip3' instead of pip"

# Quick config
alias ea='vim ~/.config/fish/aliases.fish'
alias ef='vim ~/.config/fish/config.fish'
alias eg 'vim ~/.gitconfig'
alias ev 'vim ~/.vimrc'
alias et 'vim ~/.tmux.conf'

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
alias fvim='vim (fzf)'

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
alias gst="git status -sb --ignore-submodules"
alias gst="git status"
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

# turn on coloring on grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Quick check running state of a process
alias psef="ps -ef | grep "
alias top="top -o cpu"
alias ps="command ps -SAcr -o 'uid,pid,ppid,time,rss,command'"

# Google Closure compiler shortcuts
alias jcc='java -jar ~/tools/closure_compiler/compiler.jar'

# Docker
alias dm='docker-machine'
alias dmse="eval (docker-machine env default)"
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

# Tmux
alias tml="tmux list-sessions"
# alias tma="tmux -2 attach -t $1"
alias tma="tmux -2 attach -t 0"
# alias tmk="tmux kill-session -t $1"
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
    pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
end

# Python pip update all packages
alias pupdate="pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U"
alias python=python3

# http://osxnotes.net/spotlight.html
alias spotlight="mdfind"

alias history="history | nl | tail -r | less +G"

#https://www.shredzone.de/cilla/page/383/setting-up-tp-link-tl-sg108e-with-linux.html
alias tplink="java -cp /Users/glnds/CloudStation/misc/TP-Link/patch.jar:/Users/glnds/CloudStation/misc/TP-Link/Easy_Smart.jar com.tplink.smb.easySmartUtility.EasySmartUtility"

# alias vim="nvim"
alias vimdiff="vim -d"

alias weather="curl -4 wttr.in/Grimbergen"
alias moon="curl -4 wttr.in/Moon"

alias https='http --default-scheme=https'

alias wnas="wakeonlan 00:11:32:45:3b:01"

# CLI Tools
alias cat="bat"
alias ping="prettyping --nolegend"
alias find="fd"
alias du="ncdu --color dark -rr -x --exclude .git"
alias help="tldr"
alias ls="eza"
alias ll="eza -lh"
alias la="eza -lhaa"
# alias la="ls -Gla"
# alias ll='ls -hlF'
# alias loa="ls -ld .?*"
# alias l='ls -CF'
# list only directories
# alias lsd='ls -l | grep "^d"'
# list only symbolic links
# alias lss='ls -al | grep "\->"'

# httpie > curl
# fasd

alias awless="awless --no-sync"



function akamaih
    http -h $argv[1] Pragma:'akamai-x-cache-on,akamai-x-cache-remote-on,akamai-x-check-cacheable,akamai-x-get-cache-key,akamai-x-get-ssl-client-session-id,akamai-x-get-true-cache-key,akamai-x-get-request-id,akamai-x-get-extracted-values,akamai-x-get-nonces,akamai-x-serial-no'
end
#alias uc='berks upload && knife cookbook upload parleys && knife role from file roles/*.rb && knife environment from file environments/*.rb'
#alias ucp='knife cookbook upload parleys && knife environment from file environments/*.rb'
#alias elbst="aws elb describe-instance-health --load-balancer-name vpc-frontend --output table --profile parleys"

# DPP AWS
alias ec2ls="steampipe query \"select tags -> 'Name' as name, instance_id, instance_state, instance_type, private_ip_address, image_id, launch_time from aws_ec2_instance where instance_state='running' order by name, launch_time\""
alias lsami="aws ec2 describe-images --query 'Images[*].[Tags[?Key==`Name`].Value|[0],Name,ImageId,State,CreationDate]' --filters Name=image-type,Values=machine Name=is-public,Values=false --output table --region eu-west-1"
alias s3ls="aws s3api list-buckets --query 'Buckets[*].[Name]' --output table --region eu-west-1"
alias efsls="aws efs describe-file-systems --query 'FileSystems[*].[Name,FileSystemId]' --output table --region eu-west-1"
alias vpcls='aws ec2 describe-vpcs --query "Vpcs[*].{Name:Tags[?Key==`Name`].Value|[0],Squad:Tags[?Key==`Squad`].Value|[0],ID:VpcId,CIDR:CidrBlock,DHCP:DhcpOptionsId,State:State}" --filter "Name=isDefault,Values=false" --output table --region eu-west-1'
