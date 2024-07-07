# vim: set noet ci pi sts=0 sw=4 ts=4 :
# http://www.gnu.org/software/make/manual/make.html
# http://linuxlib.ru/prog/make_379_manual.html
SHELL:=/bin/bash
DEBUG ?= 0

CURRENT_DIR := $(shell dirname "$(realpath "$(lastword $(MAKEFILE_LIST))")")
########################################################################
-include .env
export
########################################################################

all: \
	.local/bin \
	scripts


.local/bin:
	mkdir -p $@

.PHONY: scripts
scripts: \
	.local/bin/mc \
	.local/bin/tmux.sh

.local/bin/mc:
	wget -O $@ https://raw.githubusercontent.com/EvgeniyBlinov/scripts/v0.0.1/utils/fm/mc
	chmod +x $@

.local/bin/tmux.sh:
	wget -O $@ https://raw.githubusercontent.com/EvgeniyBlinov/scripts/v0.0.1/utils/tmux/tmux.sh
	chmod +x $@
