alias ..="cd .."
alias -="cd -"

alias trash="rmtrash"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

alias ea='vim ~/.config/fish/aliases.fish'
alias ef='vim ~/.config/fish/config.fish'
alias eg 'vim ~/.gitconfig'
alias ev 'vim ~/.vimrc'
alias et 'vim ~/.tmux.conf'

alias la="ls -Gla"

# List only directories
alias lsd='ls -l | grep "^d"'

# List only symbolic links
alias lss='ls -al | grep "\->"'

alias ll='ls -hlF'
alias l='ls -CF'
alias c=clear

################################
###  File ShortCut
################################
alias D="cd ~/Downloads"
alias g="git"
alias v="vim"

################################
###  Program ShortCut
################################

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
alias gpt="git push --tags"
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

alias tig="tig --all"

# turn on coloring on grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Quick check running state of a process
alias psef="ps -ef | grep "
alias top="top -o cpu"
alias ps="command ps -SAcr -o 'uid,pid,ppid,time,rss,command'"

# Google Closure compiler shortcuts
alias jcc='java -jar ~/tools/closure_compiler/compiler.jar'

# Shortcut to Google Chrome
#alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# start local markdown
alias md='gollum --host localhost --port 4566 ~/Dropbox/md_wiki'

# Docker
alias dm='docker-machine'
alias drc='docker rm (docker ps -aq)'
alias dri='docker rmi (docker images --filter dangling=true --quiet)'

# Ansible
alias ap='ansible-playbook'
alias aga='ansible-galaxy'

# Tmux
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"

# ACSL
alias iacsl="~/Scripts/start_acsl_ssh_tunnels.sh"
alias lssh="lsof -i 4tcp -P | ag '^ssh'"
alias elbd="aws elb describe-instance-health --load-balancer-name dev-ga-elb --output table --profile acsl"
alias elbt="aws elb describe-instance-health --load-balancer-name test-ga-elb --output table --profile acsl"
alias elbp="aws elb describe-instance-health --load-balancer-name prod-ga-elb --output table --profile acsl"
alias dmongo="mongo --port 27018"
alias tmongo="mongo --port 27019"
alias pmongo="mongo --port 27020"
alias goansible="cd ~/Sources/acsl/aws-ansible"
alias gogaone="cd ~/Sources/acsl/ga1"
alias gogatwo="cd ~/Sources/acsl/ga2"

function lockme
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

function update
  brew update; brew upgrade; brew cleanup
end

function upgrade
  brew cask update; brew cask cleanup
end

# Python pip update all packages
alias pupdate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

# http://osxnotes.net/spotlight.html
alias spotlight="mdfind"

alias history="history | nl"
#https://www.shredzone.de/cilla/page/383/setting-up-tp-link-tl-sg108e-with-linux.html
#
alias tplink="java -cp /Users/glnds/CloudStation/misc/TP-Link/patch.jar:/Users/glnds/CloudStation/misc/TP-Link/Easy_Smart.jar com.tplink.smb.easySmartUtility.EasySmartUtility"

#alias vim="nvim"

#alias uc='berks upload && knife cookbook upload parleys && knife role from file roles/*.rb && knife environment from file environments/*.rb'
#alias ucp='knife cookbook upload parleys && knife environment from file environments/*.rb'
#alias elbst="aws elb describe-instance-health --load-balancer-name vpc-frontend --output table --profile parleys"
