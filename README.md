# Dotfiles

## Setup (OS X)

## Homebrew dependencies
- fish
- git
- ack
- python
- vim
- tmux

Run:

	brew install fish git ack python vim tmux

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

### tmux
Install tmux

	brew install tmux

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
	ln -s ~/Sources/dotfiles/.vim/colors ~/.vim/colors

link naar complete dir
			ln -s ~/.vim/vimrc ~/.vimrc


- Global: ~/.vimrc
- Language specific: ~/.vim/ftplugin/

 
font book powerline

## Plugins
- Powerline
	
	https://github.com/Lokaltog/powerline
	
	http://powerline.readthedocs.org/en/latest/index.html
- NERDtree
	
	https://github.com/scrooloose/nerdtree
	
- Syntastic
	
	It requires either flake8, pyflakes or pylint to be installed (flake8 merges pyflakes and pep8 functionality).
	
		pip install flake8
	
	Check file syntax on open
	
		let g:syntastic_check_on_open = 1

##Vimscript
http://learnvimscriptthehardway.stevelosh.com/

## Tutorials
http://derekwyatt.org/vim/tutorials/
http://www.openvim.com/tutorial.html


