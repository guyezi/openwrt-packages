#
# Copyright (C) 2011-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=upx
PKG_RELEASE:=1

PKG_MAINTAINER:=Xingwang Liao <kuoruan@gmail.com>
PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=COPYING LICENSE
#PKG_VERSION:=2021-01-24

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-01-24
PKG_SOURCE_VERSION:=731a494ffbaa7fe78a87aa8a8facb0dcfdab8f9d
#PKG_SOURCE_URL:=https://codeload.github.com/guyezi/openwrt-upx/releases/download/openwrt-upx/
PKG_SOURCE_URL:=https://github.com/upx/upx.git
#PKG_HASH:=7b1b38e5ea108a56cd788d7a2eb7fabc98585dd70e29eaba523a9f375d36a4ce

PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_DATE).tar.gz

HOST_BUILD_DEPENDS:=ucl/host

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Host/Compile
	UPX_UCLDIR=$(STAGING_DIR_HOST) \
	$(MAKE) -C $(HOST_BUILD_DIR)/src \
		CXXFLAGS_WERROR="" LDFLAGS="$(HOST_LDFLAGS)" \
		CXX="$(HOSTCXX)"
endef

define Host/Install
	$(CP) $(HOST_BUILD_DIR)/src/upx.out $(STAGING_DIR_HOST)/bin/upx
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/upx
endef

define Package/upx
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libucl +libstdcpp +zlib
  TITLE:=The Ultimate Packer for eXecutables
  URL:=https://upx.github.io/
endef

define Package/upx/description
UPX is a free, portable, extendable, high-performance executable packer for
several different executable formats. It achieves an excellent compression ratio
and offers very fast decompression. Your executables suffer no memory overhead
or other drawbacks for most of the formats supported, because of in-place
decompression.
endef

MAKE_PATH := src

define Package/upx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/upx.out $(1)/usr/bin/upx
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,upx))
