#!/usr/bin/make -f

prepare: prepare-config

prepare-config:
	$(MAKE) -C config/ prepare

setup:
	./scripts/setup.py \
		--copy-rc \
		--packages --ubuntu

.PHONY: prepare prepare-config setup

