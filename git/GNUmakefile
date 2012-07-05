##############################################################################
include ../mk/install.mk

################################################################################
install: ~/.gitignore
~/.gitignore: ignore
	$(INSTALL_PLAIN_FILE) $< $@
	git config --global core.excludesfile '~/.gitignore'
