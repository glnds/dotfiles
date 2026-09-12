# Bootstrap (must exist before mise can do anything)
brew "git"
brew "mise"

# Shell + editor foundations
brew "fish"
brew "neovim"
brew "luarocks"
brew "tmux"
brew "direnv"

# macOS-only utilities
brew "trash"
brew "tree"

# No prebuilt darwin binary -> mise can't fetch these, brew is the fallback (see CLAUDE.md)
brew "btop" # aqua/ubi/github backends have no darwin/arm64 build
brew "eza"  # ships no darwin binary; mise asdf plugin relies on flaky cargo-quickinstall

# Casks
# alacritty: cask disabled 2026-09-01 (unsigned upstream dmg fails Gatekeeper).
# Upstream is still active, so we keep it -- `mise run alacritty-update` takes the
# dmg directly and strips quarantine. Chained into the `update` task.
cask "font-hack-nerd-font"
cask "font-meslo-lg-nerd-font"
cask "finch"
cask "markedit"
cask "handy"

# Security casks
cask "lulu"
cask "blockblock"
cask "knockknock"
cask "malwarebytes"
