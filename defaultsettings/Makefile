#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=defaultsettings
PKG_VERSION:=2
PKG_RELEASE:=9
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

#include $(INCLUDE_DIR)/package.mk

define Package/defaultsettings
  CATEGORY:=System SET
  TITLE:=Openwrt support for Default Settings
  PKGARCH:=all
  DEPENDS:=+luci-base +luci +luci-compat +@LUCI_LANG_zh-cn +nano
endef

define Package/defaultsettings/description
	Language Support Packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/defaultsettings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/defaultsettings $(1)/etc/uci-defaults/99-defaultsettings
	$(INSTALL_BIN) ./files/banner $(1)/etc/banner
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(PO2LMO) ./i18n/default.zh-cn.po $(1)/usr/lib/lua/luci/i18n/default.zh-cn.lmo
endef

include $(TOPDIR)/feeds/luci/luci.mk
