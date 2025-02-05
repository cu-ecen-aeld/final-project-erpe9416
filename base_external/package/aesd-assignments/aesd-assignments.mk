
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

 #Filled up the contents below in order to reference my assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '90cf21167ceb081beb1e55a765d414218ad3d800'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-erpe9416.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# Added my writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -m 0755 $(@D)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin/writer
endef

$(eval $(generic-package))
