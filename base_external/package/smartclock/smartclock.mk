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

SMARTCLOCK_DEPENDENCIES = sdl2 sdl2_ttf freetype

define SMARTCLOCK_BUILD_CMDS
    # console binary
    $(TARGET_CC) $(TARGET_CFLAGS) $(@D)/smartclock.c \
        -o $(@D)/smartclock
    # GUI binary
    $(TARGET_CC) $(TARGET_CFLAGS) $(@D)/smartclock_gui.c \
        -o $(@D)/smartclock_gui -lSDL2 -lSDL2_ttf -lfreetype
endef

define SMARTCLOCK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/smartclock      $(TARGET_DIR)/usr/bin/smartclock
    $(INSTALL) -D -m 0755 $(@D)/smartclock_gui  $(TARGET_DIR)/usr/bin/smartclock_gui
endef

$(eval $(generic-package))
