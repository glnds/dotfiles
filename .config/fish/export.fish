set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# set -x PATH /usr/local/opt/python/libexec/bin $PATH
# set -x PYTHONPATH "/usr/local/lib/python3.6/site-packages"
# set -x PATH ~/Library/Python/3.8/bin $PATH
# set -x PATH /Library/Frameworks/Python.framework/Versions/3.7/bin $PATH
set -x PATH ~/Library/Python/3.7/bin $PATH
#
# Cookiecutter config
# set -x COOKIECUTTER_CONFIG "~/.cookiecutterrc"

# Rust config
set -x PATH "$HOME/.cargo/bin" $PATH

# tmux fix
set -x export EVENT_NOKQUEUE=1
# set -x TERM xterm-256color

# Autossh
set -x AUTOSSH_PORT 0

set -x AWS_PROFILE "masl"

# Packer config, use dpp-build as default boto profile
set -x PACKER_LOG 1
set -x PACKER_LOG_PATH "packer.log"

# Gradle home
set -x GRADLE_HOME /usr/local/opt/gradle/libexec
set -x GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Java home
set -x JAVA_HOME (/usr/libexec/java_home -v 13)
# jenv
set -x PATH $HOME/.jenv/bin $PATH

# Maven home
set -x M2_HOME /usr/local/opt/maven/libexec
set -x  MAVEN_OPTS "-Xmx1024M"

# Go
set -x GOPATH "$HOME/go"
set -x GOBIN "$GOPATH/bin"
set -x PATH "$GOPATH/bin" $PATH

# Google Cloud
if test -e "$HOME/google-cloud-sdk/bin"
  set -x PATH "$HOME/google-cloud-sdk/bin" $PATH
end

set -x PATH "/Applications/Alacritty.app/Contents/MacOS" $PATH

# Add Ansible developer version to the beginning of PATH
#set -x PATH "/Users/glnds/Sources/ansible/bin" $PATH

# Add homebrew to the beginning of PATH
set -x PATH "/usr/local/bin" $PATH

# respect local bins
set -x PATH "./bin" $PATH

# editor
set -x EDITOR "vim"

# grep colors
setenv GREP_OPTIONS "--color=auto"

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

set -g fish_user_paths "/usr/local/opt/mongodb@3.4/bin" $fish_user_paths
