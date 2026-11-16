set -x PATH /opt/homebrew/bin $PATH

# zScaler Certificate fixes
# /etc/ssl/cert.pem + Zscaler root (works with Zscaler on and off). Rebuild:
#   cat /etc/ssl/cert.pem > ~/.config/certs/ca-bundle.pem
#   security find-certificate -a -p -c Zscaler /Library/Keychains/System.keychain >> ~/.config/certs/ca-bundle.pem
set -x AWS_CA_BUNDLE ~/.config/certs/ca-bundle.pem
set -x REQUESTS_CA_BUNDLE ~/.config/certs/ca-bundle.pem
set -x JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION true

# Language Default
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Rust config
set -x PATH "$HOME/.cargo/bin" $PATH

# mise shims — make mise-managed tools (hk, etc.) available in
# non-interactive contexts (IDE/GUI git, cron, scripts).
# `mise activate` below prepends direct install dirs for interactive use.
set -x PATH $HOME/.local/share/mise/shims $PATH

set -x COLORTERM truecolor

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
