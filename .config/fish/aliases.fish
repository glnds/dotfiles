alias ..="cd .."

# set AWS profile environment variable
alias setaws='set -x -g AWS_PROFILE'

# Use the trash can
alias trash="rmtrash"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

# Quick config
alias ea='vim ~/.config/fish/aliases.fish'
alias ef='vim ~/.config/fish/config.fish'
alias eg 'vim ~/.gitconfig'
alias ev 'vim ~/.vimrc'
alias et 'vim ~/.tmux.conf'

# Search hidden files by default
alias ag='ag --hidden'

# List directories
alias la="ls -Gla"
alias loa="ls -ld .?*"
alias ll='ls -hlF'
alias l='ls -CF'
# list only directories
alias lsd='ls -l | grep "^d"'
# list only symbolic links
alias lss='ls -al | grep "\->"'

# Clear screen
alias c='clear'

# Go to...
alias D='cd ~/Downloads'
alias taco='cd ~/Sources/dp/taco'
alias grizzly='cd ~/Sources/dp/grizzly'
alias bami='cd ~/Sources/dp/bami'
alias aura='cd ~/Sources/dp/aura'
alias macho='cd ~/Sources/dp/macho'
alias boulet='cd ~/Sources/dp/boulet'
alias lucifer='cd ~/Sources/dp/lucifer'
alias g='git'
alias v='vim'

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
alias dmse="eval (docker-machine env default)"
alias dk="docker"
alias dkls="docker ps -a"
alias dkrm='docker rm (docker ps -aq)'
alias dkrmi="docker rmi (docker images --filter dangling=true --quiet)"
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

# ACSL
alias iacsl="~/Scripts/start_acsl_dev_env.sh"
alias lssh="lsof -i 4tcp -P | ag '^ssh'"
function sshs
  ssh -A -i ~/.ssh/saw_key ec2-user@$argv[1]
end
alias elbd="aws elb describe-instance-health --load-balancer-name dev-ga-elb --output table --profile acsl"
alias elbt="aws elb describe-instance-health --load-balancer-name test-ga-elb --output table --profile acsl"
alias elbp="aws elb describe-instance-health --load-balancer-name prod-ga-elb --output table --profile acsl"
alias dmongo="mongo --port 27018"
alias tmongo="mongo --port 27019"
alias pmongo="mongo --port 27020"
alias jpa="cd ~/Sources/acsl/aws-ansible"
alias jptf="cd ~/Sources/acsl/aws-terraform"
alias jpgo="cd ~/Sources/acsl/ga1"
alias jpgt="cd ~/Sources/acsl/ga2"
alias godoc="cd ~/Sources/acsl/documentation"

# Kubernetes
alias kn="kubectl"
# Google Cloud
alias gcl="gcloud"

function lockme
  /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

function update
  brew update; brew upgrade; brew cleanup
  pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
end

# Python pip update all packages
alias pupdate="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
alias ptc="pip-compile"
alias pts="pip-sync dev-requirements.txt requirements.txt"

# http://osxnotes.net/spotlight.html
alias spotlight="mdfind"

alias history="history | nl | tail -r | less +G"

#https://www.shredzone.de/cilla/page/383/setting-up-tp-link-tl-sg108e-with-linux.html
alias tplink="java -cp /Users/glnds/CloudStation/misc/TP-Link/patch.jar:/Users/glnds/CloudStation/misc/TP-Link/Easy_Smart.jar com.tplink.smb.easySmartUtility.EasySmartUtility"

# alias vim="nvim"
alias vimdiff="nvim -d"

alias sqlplus="rlwrap sqlplus"

alias weather="curl -4 wttr.in/Grimbergen"
alias moon="curl -4 wttr.in/Moon"

alias https='http --default-scheme=https'

alias wnuci3="wakeonlan b8:ae:ed:74:00:74"
alias wnuci5="wakeonlan b8:ae:ed:79:56:d0"
alias wlogic="wakeonlan 00:30:18:c5:b1:42"
alias wnas="wakeonlan 00:11:32:45:3b:01"

# DPP
alias ocblue="oc login https://dppurhos01.server.lan:8443"
alias ocgreen="oc login https://os-cluster.server.lan:8443"

function akamaih
  http -h $argv[1] Pragma:'akamai-x-cache-on,akamai-x-cache-remote-on,akamai-x-check-cacheable,akamai-x-get-cache-key,akamai-x-get-ssl-client-session-id,akamai-x-get-true-cache-key,akamai-x-get-request-id,akamai-x-get-extracted-values,akamai-x-get-nonces,akamai-x-serial-no'
end
#alias uc='berks upload && knife cookbook upload parleys && knife role from file roles/*.rb && knife environment from file environments/*.rb'
#alias ucp='knife cookbook upload parleys && knife environment from file environments/*.rb'
#alias elbst="aws elb describe-instance-health --load-balancer-name vpc-frontend --output table --profile parleys"

# DPP AWS
alias lsec2="aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value|[0],Tags[?Key==`Squad`].Value|[0],InstanceId,State.Name,InstanceType,PrivateIpAddress,PublicIpAddress,Placement.AvailabilityZone,ImageId,LaunchTime]' --filters Name=instance-state-name,Values=pending,running,shutting-down,stopping,stopped --output table"
alias lsami="aws ec2 describe-images --query 'Images[*].[Tags[?Key==`Name`].Value|[0],Name,ImageId,State,CreationDate]' --filters Name=image-type,Values=machine Name=is-public,Values=false --output table"
alias lss3="aws s3api list-buckets --query 'Buckets[*].[Name]' --output table"
alias lsefs="aws efs describe-file-systems --query 'FileSystems[*].[Name,FileSystemId]' --output table"
alias lsvpc='aws ec2 describe-vpcs --query "Vpcs[*].{Name:Tags[?Key==`Name`].Value|[0],Squad:Tags[?Key==`Squad`].Value|[0],ID:VpcId,CIDR:CidrBlock,DHCP:DhcpOptionsId,State:State}" --filter "Name=isDefault,Values=false" --output table'
