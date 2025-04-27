##############################################################
#
# Smartclock
#
##############################################################

SMARTCLOCK_VERSION      = main
SMARTCLOCK_SITE = git@github.com:erpe9416/final-project-assignment-erpe9416.git
SMARTCLOCK_SITE_METHOD  = git
SMARTCLOCK_GIT_SUBMODULES = YES

SMARTCLOCK_DEPENDENCIES = \
    host-cmake \
    host-pkgconf \
    libgpiod

define SMARTCLOCK_BUILD_CMDS
	@mkdir -p $(@D)/build
	cd $(@D)/build && \
	PKG_CONFIG_LIBDIR=$(STAGING_DIR)/usr/lib/pkgconfig && \
	PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) && \
	cmake \
	  -DCMAKE_C_COMPILER=$(TARGET_CC) \
	  -DCMAKE_CXX_COMPILER=$(TARGET_CXX) \
	  -DCMAKE_SYSTEM_NAME=Linux \
	  -DCMAKE_SYSROOT=$(STAGING_DIR) \
	  -DCMAKE_FIND_ROOT_PATH=$(STAGING_DIR) \
	  -DCMAKE_PREFIX_PATH=$(STAGING_DIR)/usr \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DLV_USE_VECTOR_GRAPHIC=OFF \
	  .. && \
	$(MAKE) -j$(PARALLEL_JOBS)
endef

define SMARTCLOCK_INSTALL_TARGET_CMDS
	install -D -m 0755 \
	  $(@D)/bin/lvgl-app \
	  $(TARGET_DIR)/usr/bin/lvgl-app
endef




$(eval $(generic-package))
