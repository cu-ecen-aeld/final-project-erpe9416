# Added this to resolve an error building with DirectFB
LIBZLIB_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Wno-error"
