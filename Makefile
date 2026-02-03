#!/usr/bin/make -f

prepare: prepare-tmux prepare-nvim

prepare-tmux:
	cp $(HOME)/.tmux.conf ./config/dotfiles/

prepare-nvim:
	cp -r $(HOME)/.config/nvim ./config/

prepare-zsh:
	cp $(HOME)/.zshrc ./config/dotfiles/

.PHONY: prepare prepare-nvim prepare-tmux prepare-zsh

