#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install neovim luarocks fish tmux gitui lazygit htop jq ripgrep fzf yarn
brew install zoxide glow trash rlwrap bat fd tldr tree alacritty python3
brew install font-hack-nerd-font zellij

# https://www.nerdfonts.com
brew install --cask font-meslo-lg-nerd-font
brew install --cask finch

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
