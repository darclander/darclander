#!/usr/bin/make -f

prepare: prepare-tmux prepare-zsh prepare-nvim prepare-bash prepare-pylint prepare-gitconfig

prepare-tmux:
	cp $(HOME)/.tmux.conf ./dotfiles/

prepare-zsh:
	cp $(HOME)/.zshrc ./dotfiles/

prepare-bash:
	cp $(HOME)/.bashrc ./dotfiles/

prepare-pylint:
	cp $(HOME)/.pylintrc ./dotfiles/

prepare-gitconfig:
	cp $(HOME)/.gitconfig_shared ./dotfiles/.gitconfig

prepare-nvim:
	rsync -a --exclude=".git" $(HOME)/.config/nvim ./

.PHONY: prepare prepare-nvim prepare-tmux prepare-zsh prepare-bash prepare-pylintrc prepare-gitconfig

