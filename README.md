# Dotfiles
These are my personal dotfiles to setup my machine and developing environment. 

## Installation

### Step 1:

cd to your home directory and clone this repository via git clone.

	$ cd ~
	$ git clone https://github.com/glnds/dotfiles.git


### Step 2:

You should now have dotfiles folder in your home directory. To setup the dotfiles, execute boostrap.sh.

	$ bash ~/dotfiles/bootstrap.sh

	
### Step 3:

- Make [fish](https://github.com/fish-shell/fish-shell/) your default shell:

		$ echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
		$ chsh -s /usr/local/bin/fish
		
- Tweak the local fish shell (theme and color)

		$ fish_config

*Note: Fish can parse your installed man pages and automatically generate completion files for your command-line tools. You should periodically run the following command to update those completions, which are stored in ~/.config/fish/completions by default:*

	$ fish_update_completions

### iTerm

#### Font
For iTerm2, open the Preferences dialog, select Profiles, select Text, and select Change Font for the Regular Font to set the **Inconsolata 14pt** for Powerline font and save. Do the exact same for the Non-ASCII Font setting as well.

#### Colors
For iTerm2, open the Preferences dialog, select Profiles, select Terminal, set Report Terminal Type to **xterm-256color**

## Tools

- [bat](https://github.com/sharkdp/bat): A cat(1) clone with wings.
 
	```
	alias cat="bat"
	```
- [exa](https://the.exa.website/introduction): A modern replacement for ls.
	```
	alias ls="exa"
	alias ll="exa -lh"
	alias la="exa -lhaa"
	```
- [fd](https://github.com/sharkdp/fd/): A simple, fast and user-friendly alternative to 'find'.
	```
	alias find="fd"
	```
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
	
	Key bindings [didn't work out of the box](https://github.com/junegunn/fzf/issues/851). This was fixed by manually creating a symlink to the fzf key binding file for fish.
	```
	ln -s /usr/local/Cellar/fzf/0.18.0/shell/key-bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish
```
	```
	 alias fvim='vim (fzf)'
	 ```
- [ncdu](https://dev.yorhel.nl/ncdu): NCurses Disk Usage.
	```
	alias du="ncdu --color dark -rr -x --exclude .git"
	```
- [prettyping](http://denilson.sa.nom.br/prettyping/): prettyping is a wrapper around the standard ping tool, making the output prettier, more colorful, more compact, and easier to read.
	```
	alias ping="prettyping --nolegend"
	```
- [tldr](https://tldr.sh/): Simplified and community-driven man pages.
	```
	alias help="tldr"
	```

## TODO List
- https://github.com/clvv/fasd
- https://fonts.google.com/specimen/Fira+Mono

## References
- [CLI: improved](https://remysharp.com/2018/08/23/cli-improved)
