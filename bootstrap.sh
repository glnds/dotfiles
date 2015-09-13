mkdir -p ~/.config/fish


chsh -s /usr/local/bin/fish

#!/bin/bash
shopt -s dotglob

cd "$(dirname "$0")"

DOTFILES_PATH=$HOME/Sources/dotfiles



curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
    echo "Installing Plug"
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "Successfully updated dotfiles!"
echo " "


