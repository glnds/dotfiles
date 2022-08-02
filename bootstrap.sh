#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/dotfiles

brew update
brew install neovim packer ansible write-good markdownlint-cli
brew install cmake fish tmux tig htop jq ripgrep fzf yarn go
brew install httpie nmap ipcalc trash rlwrap ctags python3 bat fd prettyping tldr ncdu
brew install ssh-copy-id pidof tree reattach-to-user-namespace exa gnu-sed alacritty

# https://www.nerdfonts.com/font-downloads
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font

pip3 install virtualfish powerline-status pipenv neovim --user --upgrade
sudo pip3 install --upgrade neovim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.pip ~/
ln -s ~/dotfiles/.config ~/

# LSP's
#npm install -g typescript-language-server

#if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
#  echo "Installing Plug"
#  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi

echo "Successfully updated dotfiles!"
echo " "
