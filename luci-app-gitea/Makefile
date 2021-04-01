# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#
# Improve by guyezi <admin@guyezi.com>
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for gitea
LUCI_DEPENDS:=+git +wget
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-gitea
PKG_VERSION:=3.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
#PKG_MAINTAINER:=[CTCGFW] Project OpenWRT

#PO2LMO:=$(BUILD_DIR)/luci/build/po2lmo

#define Build/Prepare
	#$(foreach po,$(wildcard ${CURDIR}/po/*/*.po), \
		#$(PO2LMO) $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
#endef
define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
  ( . /etc/uci-defaults/luci-gitea ) && rm -f /etc/uci-defaults/luci-gitea && mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
  chown git:git /var/lib/gitea/{data,indexers,log}
  chmod 750 /var/lib/gitea/{data,indexers,log}
  mkdir /etc/gitea
  chown root:git /etc/gitea
  chmod 770 /etc/gitea
##/etc/init.d/gitea enable >/dev/null 2>&1
  exit 0
}
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
