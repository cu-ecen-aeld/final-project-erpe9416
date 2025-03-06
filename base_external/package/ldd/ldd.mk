LDD_VERSION = 9e0e13b46fad63600e30d7900485291523803f7d
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-erpe9416.git
LDD_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules scull

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/modules/
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/modules/
	$(INSTALL) -D -m 0755 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules/
endef

$(eval $(kernel-module))
$(eval $(generic-package))

