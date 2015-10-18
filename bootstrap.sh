#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install cmake fish git python vim tmux the_silver_searcher archey
brew upgrade

pip install powerline-status --upgrade
pip install virtualfish --upgrade

git clone https://github.com/powerline/fonts.git ~/dotfiles/powerline 
~/dotfiles/powerline/install.sh

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.vimrc ~/.nvimrc
ln -s ~/dotfiles/.vim ~/.nvim
ln -s ~/dotfiles/.config ~/

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo "Installing Plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Successfully updated dotfiles!"
echo " "
