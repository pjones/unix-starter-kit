##############################################################################
include ../mk/install.mk

##############################################################################
EL_FILES = $(shell ls *.el|grep -v emacsrc)
EL_DEST  = $(HOME)/.emacs.d/usk

##############################################################################
$(foreach f,$(EL_FILES),$(eval $(call INSTALL_FILE_TO,$(f),$(EL_DEST))))

##############################################################################
install: $(HOME)/.emacs
$(HOME)/.emacs: emacsrc.el
	$(INSTALL_PLAIN_FILE) $< $@
	emacs -nw -f kill-emacs # load all packages
