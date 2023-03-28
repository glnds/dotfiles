set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -x PATH /opt/homebrew/bin $PATH

# zScaler Certifacte fixes
set -x AWS_CA_BUNDLE /etc/ssl/cert.pem
set -x REQUESTS_CA_BUNDLE /etc/ssl/cert.pem

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

#use gnu-sed
set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

set -x PATH /Users/glnds/Library/Python/3.11/bin $PATH

# Rust config
set -x PATH "$HOME/.cargo/bin" $PATH
set -x RUST_SRC_PATH /Users/glnds/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library

# tmux fix
set -x export EVENT_NOKQUEUE=1
# set -x TERM xterm-256color

# Autossh
set -x AUTOSSH_PORT 0

set -x AWS_PROFILE "sdo"

# Packer config, use dpp-build as default boto profile
set -x PACKER_LOG 1
set -x PACKER_LOG_PATH "packer.log"

# Gradle home
set -x GRADLE_HOME /usr/local/opt/gradle/libexec
set -x GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Java home
set -x JAVA_HOME (/usr/libexec/java_home -v 14)
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
