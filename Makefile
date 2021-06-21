SHELL := /bin/bash

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

dconf-dump: ## Save dconf settings to .config/dconf/settings.dconf
	dconf dump /org/gnome/ > ~/.config/dconf/settings.dconf

dconf-load: ## Load dconf settings from .config/dconf/settings.dconf
	dconf load /org/gnome/ < ~/.config/dconf/settings.dconf

vsc-extensions: ## Save a list of VSC extensions to .config/Code/extensions.txt
	ls .vscode/extensions/ > ~/.config/Code/extensions.txt

update: ## Do apt update and autoremove
	sudo apt update -y && sudo apt upgrade -y
	sudo apt autoremove -y
