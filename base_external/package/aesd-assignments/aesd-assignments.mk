
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = '649b9f95f834fa6b70695d262c9398d27e34fd95'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-erpe9416.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

USE_AESD_CHAR_DEVICE ?= 1

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(info Executing make on server with USE_AESD_CHAR_DEVICE set to $(USE_AESD_CHAR_DEVICE))
	# I had some issues making sure the make runs with USE_AESD_CHAR_DEVICE=1...
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server CFLAGS="-Wall -Werror -DUSE_AESD_CHAR_DEVICE=1" V=1
	strings $(@D)/server/aesdsocket | grep "aesdsocket configured"
	$(info Completed make on server with USE_AESD_CHAR_DEVICE set to $(USE_AESD_CHAR_DEVICE))
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/aesd-char-driver ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS) modules
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
    
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin
	
	$(INSTALL) -D -m 0644 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/lib/modules/aesdchar.ko
endef

$(eval $(generic-package))
