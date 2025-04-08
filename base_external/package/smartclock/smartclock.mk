##############################################################
#
# Smartclock
#
##############################################################

SMARTCLOCK_VERSION      = 1.0
SMARTCLOCK_SITE = $(TOPDIR)/../base_external/package/smartclock
SMARTCLOCK_SITE_METHOD  = local
SMARTCLOCK_SUBDIR = .
SMARTCLOCK_LICENSE      = MIT
SMARTCLOCK_LICENSE_FILES = LICENSE

define SMARTCLOCK_BUILD_CMDS
    $(TARGET_CC) $(TARGET_CFLAGS) $(@D)/hello.c -o $(@D)/smartclock
endef

define SMARTCLOCK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/smartclock $(TARGET_DIR)/usr/bin/smartclock
endef

$(eval $(generic-package))

