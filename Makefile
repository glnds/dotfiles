DOTFILES := $(HOME)/dotfiles

.PHONY: all install link unlink help

all: install link

help:
	@echo "usage: make [target]"
	@echo ""
	@echo "  all       install packages and create symlinks (default)"
	@echo "  install   brew update and bundle install from Brewfile"
	@echo "  link      symlink dotfiles to home directory"
	@echo "  unlink    remove symlinks from home directory"
	@echo "  help      show this help"

install:
	brew update --quiet
	brew bundle

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
