#set -x PATH /opt/homebrew/bin $PATH
#set -x PATH /opt/homebrew/sbin $PATH

# zScaler Certifacte fixes
set -x AWS_CA_BUNDLE /etc/ssl/cert.pem
set -x REQUESTS_CA_BUNDLE /etc/ssl/cert.pem
set -x JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION true

# Language Default
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

#use gnu-sed
#set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
#
set -x PATH /Users/glnds/Library/Python/3.13/bin $PATH
#
## Rust config
set -x PATH "$HOME/.cargo/bin" $PATH
#set -x RUST_SRC_PATH /Users/glnds/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library
#
## tmux fix
#set -x export EVENT_NOKQUEUE=1
#set -x TERM xterm-256color
#
## Autossh
#set -x AUTOSSH_PORT 0
#
set -x AWS_PROFILE sdo
set -x AWS_REGION eu-west-1
#
## Go
#set -x GOPATH "$HOME/go"
#set -x GOBIN "$GOPATH/bin"
#set -x PATH "$GOPATH/bin" $PATH
#
#
## respect local bins
#set -x PATH "./bin" $PATH

# editor
set -x EDITOR nvim

# grep colors
setenv GREP_OPTIONS "--color=auto"

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
