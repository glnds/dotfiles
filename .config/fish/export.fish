set -x PATH /opt/homebrew/bin $PATH
set -x PATH /opt/homebrew/sbin $PATH

# zScaler Certifacte fixes
set -x AWS_CA_BUNDLE /etc/ssl/cert.pem
set -x REQUESTS_CA_BUNDLE /etc/ssl/cert.pem
set -x JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION true

# Language Default
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Rust config
set -x PATH "$HOME/.cargo/bin" $PATH

# Obsidian CLI
set -x PATH /Applications/Obsidian.app/Contents/MacOS $PATH
set -x AWS_PROFILE sdo


set -x COLORTERM truecolor

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
