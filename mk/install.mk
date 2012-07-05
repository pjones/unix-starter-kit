##############################################################################
INSTALL_PLAIN_FILE = install -m 0644

##############################################################################
.PHONEY: install
install:
	@ : # do nothing

##############################################################################
# $1: The file to install
# $2: The destination name
# $3: File mode (default 0644)
define INSTALL_FILE_AS
install: $(2)
$(2): $(1)
	@ mkdir -p $(dir $2)
	install -m $(if $(3),$(3),0644) $$< $$@
endef

##############################################################################
# $1: file to install as ~/.$(1)
define INSTALL_DOT_FILE
$(eval $(call INSTALL_FILE_AS,$(1),$(HOME)/.$(notdir $(1))))
endef

################################################################################
# $1: file to install as ~/.$(1) with the exec bits set.
define INSTALL_EXEC_DOT_FILE
$(eval $(call INSTALL_FILE_AS,$(1),$(HOME)/.$(notdir $(1)),0755))
endef

##############################################################################
# $1: The file to install
# $2: The directory to put it in
define INSTALL_FILE_TO
$(eval $(call INSTALL_FILE_AS,$(1),$(2)/$(notdir $(1))))
endef
