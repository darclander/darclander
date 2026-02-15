#!/usr/bin/make -f

prepare: prepare-config

prepare-config:
	$(MAKE) -C config/ prepare

.PHONY: prepare prepare-config

