################################################################################
#
# libopenmpt
#
################################################################################

LIBOPENMPT_VERSION = 0.4.23
LIBOPENMPT_SOURCE = libopenmpt-${LIBOPENMPT_VERSION}+release.autotools.tar.gz
LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
LIBOPENMPT_INSTALL_STAGING = YES
LIBOPENMPT_AUTORECONF = YES
LIBOPENMPT_DEPENDENCIES = host-pkgconf zlib host-doxygen mpg123

ifeq ($(BR2_PACKAGE_PULSEAUDIO),)
define LIBOPENMPT_CONFIGURE_CMDS
    cd $(@D); ./autogen.sh; $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE="$(HOST_DIR)/usr/bin/" \
        ./configure --host="$(GNU_TARGET_NAME)" --without-pulseaudio --without-sndfile \
                    --prefix=/usr
endef
endif

$(eval $(autotools-package))
