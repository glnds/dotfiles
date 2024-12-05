#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install neovim luarocks fish tmux gitui htop jq ripgrep fzf yarn
brew install zoxide glow trash rlwrap bat fd tldr tree alacritty

# https://www.nerdfonts.com/font-downloads
brew install --cask font-meslo-lg-nerd-font

#pip3 install virtualfish powerline-status pipenv neovim --user --upgrade
#sudo pip3 install --upgrade neovim

#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
#ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.tmux ~/.tmux
#ln -s ~/dotfiles/.vimrc ~/.vimrc
#ln -s ~/dotfiles/.vim ~/
#ln -s ~/dotfiles/.pip ~/
ln -s ~/dotfiles/.config ~/

echo "Successfully updated dotfiles!"
echo " "
