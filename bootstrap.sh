#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install neovim luarocks fish tmux gitui htop jq ripgrep fzf
brew install zoxide glow trash bat fd tree eza uv gh markdownlint-cli2
brew install awscli aws-sam-cli cfn-lint cloudformation-guard

brew install --cask alacritty
brew install --cask font-hack-nerd-font
brew install --cask font-meslo-lg-nerd-font
brew install --cask finch
brew install --cask markedit
brew install --cask claude-code

# https://powerline.readthedocs.io/en/latest/
pip3 install --user powerline-status --break-system-packages

# https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux ~/.tmux
ln -s ~/dotfiles/.config ~/
ln -s ~/dotfiles/.markdownlint.yaml ~/.markdownlint.yaml

echo "Successfully updated dotfiles!"
echo " "
