##############################################################
#
# Smartclock
#
##############################################################

SMARTCLOCK_VERSION       = 1.0
SMARTCLOCK_SITE          = $(BR2_EXTERNAL_project_base_PATH)/package/smartclock
SMARTCLOCK_SITE_METHOD   = local
SMARTCLOCK_SUBDIR        = .
SMARTCLOCK_LICENSE       = MIT
SMARTCLOCK_LICENSE_FILES = LICENSE

# If you have LVGL or pthread dependencies later, you could add them here
# SMARTCLOCK_DEPENDENCIES = lvgl lv_drivers

define SMARTCLOCK_BUILD_CMDS
    # Compile the console program
    $(TARGET_CC) $(TARGET_CFLAGS) \
        $(@D)/smartclock.c \
        -o $(@D)/smartclock

    # Compile the GUI program (link against pthread and math libraries)
    $(TARGET_CC) $(TARGET_CFLAGS) \
        $(@D)/smartclock_gui.c \
        -o $(@D)/smartclock_gui \
        -lpthread -lm
endef

define SMARTCLOCK_INSTALL_TARGET_CMDS
    # Install console binary
    $(INSTALL) -D -m 0755 $(@D)/smartclock \
        $(TARGET_DIR)/usr/bin/smartclock

    # Install GUI binary
    $(INSTALL) -D -m 0755 $(@D)/smartclock_gui \
        $(TARGET_DIR)/usr/bin/smartclock_gui
endef

$(eval $(generic-package))
