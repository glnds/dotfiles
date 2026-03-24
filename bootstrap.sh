#!/bin/bash

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install neovim luarocks fish tmux gitui htop jq ripgrep fzf
brew install zoxide glow trash bat fd tree eza uv gh markdownlint-cli2
brew install awscli aws-sam-cli cfn-lint cloudformation-guard

brew install --cask alacritty font-hack-nerd-font font-meslo-lg-nerd-font \
  finch markedit claude-code

# Security
brew install --cask lulu blockblock knockknock malwarebytes
brew install git-secrets      # blocks AWS keys and secrets from being committed
brew install trufflehog

ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tmux ~/.tmux
ln -sf ~/dotfiles/.config ~/
ln -sf ~/dotfiles/.markdownlint.yaml ~/.markdownlint.yaml

echo "Successfully updated dotfiles!"
