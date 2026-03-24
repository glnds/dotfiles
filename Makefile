DOTFILES := $(HOME)/dotfiles

.PHONY: all install link unlink

all: install link

install:
	brew update
	brew install neovim luarocks fish tmux gitui htop jq ripgrep fzf
	brew install zoxide glow trash bat fd tree eza uv gh markdownlint-cli2
	brew install awscli aws-sam-cli cfn-lint cloudformation-guard
	brew install git-secrets trufflehog
	brew install --cask alacritty font-hack-nerd-font font-meslo-lg-nerd-font \
		finch markedit claude-code
	brew install --cask lulu blockblock knockknock malwarebytes

link:
	ln -sfn $(DOTFILES)/.gitconfig $(HOME)/.gitconfig
	ln -sfn $(DOTFILES)/.tmux $(HOME)/.tmux
	ln -sfn $(DOTFILES)/.config $(HOME)/.config
	ln -sfn $(DOTFILES)/.markdownlint.yaml $(HOME)/.markdownlint.yaml

unlink:
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.tmux
	rm -f $(HOME)/.config
	rm -f $(HOME)/.markdownlint.yaml
