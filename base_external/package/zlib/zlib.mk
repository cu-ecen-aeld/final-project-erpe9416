# Added this to resolve an error building with DirectFB
ZLIB_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Wno-error"
