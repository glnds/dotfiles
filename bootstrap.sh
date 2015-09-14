#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install fish git ack python vim tmux
brew upgrade

pip install powerline-status --upgrade

git clone https://github.com/powerline/fonts.git ~/dotfiles/powerline 
~/dotfiles/powerline/install.sh

ln -s ~/dotfiles/.ackrc ~/.ackrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.config ~/

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo "Installing Plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Successfully updated dotfiles!"
echo " "
