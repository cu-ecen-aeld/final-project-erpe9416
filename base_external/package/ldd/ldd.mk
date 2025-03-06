LDD_VERSION = 9e0e13b46fad63600e30d7900485291523803f7d
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-erpe9416.git
LDD_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules scull

$(eval $(kernel-module))
$(eval $(generic-package))

