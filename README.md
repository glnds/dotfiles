# Dotfiles
These are my personal dotfiles to setup my machine and developing environment. 

##Installation

Step 1:

cd to your home directory and clone this repository via git clone.

$ cd ~
$ git clone https://github.com/glnds/dotfiles.git

### Powerline
Install powerline	


	pip install powerline-status
	
Install powerline fonts
	
	git clone https://github.com/powerline/fonts.git
	./install.sh


### fish - the friendly interactive shell
https://github.com/fish-shell/fish-shell/

Make Fish your default shell:

	chsh -s /usr/local/bin/fish

Tweak the local fish shell (theme and color)

	fish_config

Fish can parse your installed man pages and automatically generate completion files for your command-line tools. You should periodically run the following command to update those completions, which are stored in ~/.config/fish/completions by default:

	fish_update_completions

### Zsh
Make zsh your default shell

	chsh -s $(which zsh)


Install Vundle

	https://github.com/gmarik/Vundle.vim
	
### iTerm

#### Font
For iTerm2, open the Preferences dialog, select Profiles, select Text, and select Change Font for the Regular Font to set the **Inconsolata 14pt** for Powerline font and save. Do the exact same for the Non-ASCII Font setting as well.

#### Colors
For iTerm2, open the Preferences dialog, select Profiles, select Terminal, set Report Terminal Type to **xterm-256color**





## Config

	ln -s ~/Sources/dotfiles/.zshrc ~/.zshrc
	ln -s ~/Sources/dotfiles/.tmux.conf ~/.tmux.conf
	ln -s ~/Sources/dotfiles/.vim/vimrc ~/.vimrc
	ln -s ~/Sources/dotfiles/.vim/ftplugin ~/.vim/ftplugin
    ln -s ~/Sources/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
    ln -s ~/Sources/dotfiles/.config/fish/aliases.fish ~/.config/fish/aliases.fish
    ln -s ~/Sources/dotfiles/.config/fish/utils.fish ~/.config/fish/utils.fish
    ln -s ~/Sources/dotfiles/.config/fish/export.fish ~/.config/fish/export.fish
	ln -s ~/Sources/dotfiles/.vim/colors ~/.vim/colors
	ln -s ~/Sources/dotfiles/.gitconfig ~/.gitconfig

link naar complete dir
			ln -s ~/.vim/vimrc ~/.vimrc


- Global: ~/.vimrc
- Language specific: ~/.vim/ftplugin/

 
font book powerline






