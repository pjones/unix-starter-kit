##############################################################################
include ../mk/install.mk

##############################################################################
LIB_FILES = $(wildcard lib/*.el)
LIB_DEST  = $(HOME)/.emacs.d/usk
$(foreach f,$(LIB_FILES),$(eval $(call INSTALL_FILE_TO,$(f),$(LIB_DEST))))

##############################################################################
THEME_FILES = $(wildcard themes/*.el)
THEME_DEST  = $(HOME)/.emacs.d/themes
$(foreach f,$(THEME_FILES),$(eval $(call INSTALL_FILE_TO,$(f),$(THEME_DEST))))

##############################################################################
install: $(HOME)/.emacs.d/rhtml
$(HOME)/.emacs.d/rhtml: rhtml
	cp -pr $< $@

##############################################################################
install: $(HOME)/.emacs
$(HOME)/.emacs: emacsrc.el
	$(INSTALL_PLAIN_FILE) $< $@
	emacs --batch --script ~/.emacs > /dev/null 2>&1
