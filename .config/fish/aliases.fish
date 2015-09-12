alias ..="cd .."
alias -="cd -"

alias ea='vim ~/.config/fish/aliases.fish'
alias ef='vim ~/.config/fish/config.fish'
alias eg 'vim ~/.gitconfig'
alias ev 'vim ~/.vimrc'
alias et 'vim ~/.tmux.conf'

alias la="ls -Gla"

# List only directories
alias lsd='ls -l | grep "^d"'

alias ll='ls -ahlF'
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
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gbd="git branch -D"
alias gst="git status -sb --ignore-submodules"
alias gstl="git status"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git lg"
alias gpom="git pull origin master"
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
