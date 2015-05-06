# Dotfiles

## Setup (OS X)

### Powerline
Install powerline	


	pip install powerline-status


### Zsh
Make zsh your default shell

	chsh -s $(which zsh)

### tmux
Install tmux

	brew install tmux

### vim
Install vim

	brew install vim
	brew install macvim with params

Install Vundle

	https://github.com/gmarik/Vundle.vim

- Put everything in one directory

		mv .vimrc ~/.vim/vimrc
		ln -s ~/.vim/vimrc ~/.vimrc
	
- Make a new Github repository to store your configuration
	- First add a .gitignore file
			
			cd ~/.vim
			touch .gitignore 
	
		Add the following lines to the .gitignore file
		
			bundle/
			.netrwhistmacvim s




## Config
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


