DOTFILES := $(HOME)/dotfiles

.PHONY: all install link unlink

all: install link

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
