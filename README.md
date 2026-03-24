# Dotfiles

These are my personal dotfiles to setup my machine and developing environment.

## Installation

### Prerequisites

- `brew` installed
- `git` installed
- `java` install through [java.com](https://www.java.com/en/)

### Step 1: git clone

cd to your home directory and clone this repository.

```console
cd ~
git clone https://github.com/glnds/dotfiles.git
```

### Step 2: bootstrapping

You should now have a dotfiles folder in your home directory. To setup these dotfiles,
execute boostrap.sh.

```console
bash ~/dotfiles/bootstrap.sh
```

### Step 3: change shell

Make [fish](https://github.com/fish-shell/fish-shell/) your default shell:

```console
sudo bash -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
```

*Note: Fish can parse your installed man pages and automatically generate completion
files for your command-line tools. You should periodically run the following command
to update those completions, which are stored in ~/.config/fish/completions by default:*

```console
fish_update_completions
```

#### Step 4: Prepare nvim

Open nvim — [LazyVim](https://www.lazyvim.org/) will auto-install plugins on
first launch.

## Security

Lightweight macOS security tools for network monitoring, persistence detection, and malware scanning.

- **[LuLu](https://objective-see.org/products/lulu.html)** — open-source firewall that blocks unknown
  outgoing connections. Alerts on new outbound network activity so you can allow/deny per-app.
- **[BlockBlock](https://objective-see.org/products/blockblock.html)** — monitors persistence locations
  (launch daemons, login items, etc.) and alerts when something tries to install persistently.
  Catches malware that survives reboots.
- **[KnockKnock](https://objective-see.org/products/knockknock.html)** — scans for persistently
  installed software (launch items, kernel extensions, browser plugins). Useful for auditing what's
  set to run automatically.
- **[Malwarebytes](https://www.malwarebytes.com/mac)** — on-demand malware scanner and remover.
  Catches adware, PUPs, and known malware.
- **[git-secrets](https://github.com/awslabs/git-secrets)** — blocks AWS keys and secrets from
  being committed.
- **[TruffleHog](https://github.com/trufflesecurity/trufflehog)** — scans repos for leaked
  credentials and secrets.

## Tools

- [bat](https://github.com/sharkdp/bat): A cat(1) clone with wings.

	```Shell
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
