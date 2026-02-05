#!/usr/bin/make -f

prepare: prepare-tmux prepare-zsh prepare-nvim

prepare-tmux:
	cp $(HOME)/.tmux.conf ./config/dotfiles/

prepare-zsh:
	cp $(HOME)/.zshrc ./config/dotfiles/

prepare-nvim:
	cp -r $(HOME)/.config/nvim ./config/

.PHONY: prepare prepare-nvim prepare-tmux prepare-zsh

