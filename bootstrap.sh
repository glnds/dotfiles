#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install neovim packer ansible
brew install cmake fish git python tmux tig htop jq ripgrep fzf yarn go
brew install httpie nmap ipcalc rmtrash rlwrap ctags gradle python3 bat fd prettyping tldr ncdu
brew install ssh-copy-id pidof tree reattach-to-user-namespace exa goreleaser gnu-sed
brew cask install java alacritty aerial visual-studio-code

brew tap tj/mmake https://github.com/tj/mmake.git
brew install tj/mmake/mmake

brew tap mitchellh/gon
brew install mitchellh/gon/gon

pip3 install virtualfish powerline-status pipenv neovim --user --upgrade
pip3 install pyright-language-server pylint
sudo pip3 install --upgrade neovim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.cfnlintrc ~/.cfnlintrc
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
