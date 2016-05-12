#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

sudo mkdir -p /data/db
sudo chown -R glnds:staff /data/db

brew update
brew install cmake fish git python tmux the_silver_searcher archey tig htop 
brew install httpie rmtrash nmap ipcalc rmtrash rlwrap ctags gradle python3
brew install mongodb wakeonlan ssh-copy-id
brew tap neovim/neovim
brew install --HEAD neovim
brew tap caskroom/versions
brew tap wercker/wercker
brew cask install iterm2-nightly
brew cask install --force virtualbox
brew cask install --forcce vagrant
brew cask install --force vagrant-manager
brew cask install --force dockertoolbox
brew install wercker-cli
brew upgrade

pip install ansible --upgrade
pip install pip --upgrade
pip install powerline-status --upgrade
pip install virtualfish --upgrade
pip install neovim --upgrade
pip install ansible-role-manager --upgrade
pip install pip-tools

git clone https://github.com/powerline/fonts.git ~/dotfiles/powerline 
~/dotfiles/powerline/install.sh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.virtualenvs ~/
ln -s ~/dotfiles/.config ~/
ln -s ~/dotfiles/gradle.properties ~/.gradle/gradle.properties

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo "Installing Plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Successfully updated dotfiles!"
echo " "
