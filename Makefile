#!/usr/bin/make -f

prepare-nvim:
	cp -r $(HOME)/.config/nvim ./config/

.PHONY: prepare-nvim


