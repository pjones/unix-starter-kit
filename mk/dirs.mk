################################################################################
# $1: A list of directories to descend into
define DESCEND_INTO_DIRECTORIES
.PHONY: directory_descender
install: directory_descender
directory_descender:
	@ for d in $(1); do $(MAKE) -C $$$$d install; done
endef
