#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

sudo mkdir -p /data/db
sudo chown -R glnds:staff /data/db

brew update
brew install vim --with-lua
brew install cmake fish git python tmux the_silver_searcher tig htop jq
brew install httpie nmap ipcalc rmtrash rlwrap ctags gradle python3
brew install wakeonlan ssh-copy-id pidof tree reattach-to-user-namespace
brew tap caskroom/versions
brew cask install java iterm2
brew upgrade

pip3 install pip --upgrade
pip3 install virtualfish --upgrade
pip3 install pip-tools --upgrade
pip3 install yamllint --upgrade
pip3 install boto3 --upgrade
pip3 install yapf --upgrade
pip3 install poerline-status --upgrade

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/pylint.rc ~/pylint.rc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.pip ~/
ln -s ~/dotfiles/.config ~/
ln -s ~/dotfiles/gradle.properties ~/.gradle/gradle.properties

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo "Installing Plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Successfully updated dotfiles!"
echo " "
