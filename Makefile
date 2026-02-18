#!/usr/bin/make -f

prepare: prepare-config

prepare-config:
	$(MAKE) -C config/ prepare

setup:
	./scripts/setup.py \
		--copy-rc

.PHONY: prepare prepare-config setup

