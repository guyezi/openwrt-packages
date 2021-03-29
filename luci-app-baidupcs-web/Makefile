#
# <https://github.com/KFERMercer/luci-app-baidupcs-web>
# 
# Copyright (C) 2020 KFERMercer <KFER.Mercer@gmail.com>
# Copyright (C) 2020 [CTCGFW] Project OpenWRT
# 
# THIS IS FREE SOFTWARE, LICENSED UNDER GPLv3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-baidupcs-web
LUCI_TITLE:=LuCI support for BaiduPCS-Go
LUCI_DEPENDS:=+baidupcs-web +wget +openssl-util
LUCI_PKGARCH:=all
PKG_VERSION:=1.0
PKG_RELEASE:=5
PKG_MAINTAINER:=<https://github.com/KFERMercer/luci-app-baidupcs-web>

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
( . /etc/uci-defaults/luci-baidupcs-web ) && rm -f /etc/uci-defaults/luci-baidupcs-web
/etc/init.d/baidupcs-web enable >/dev/null 2>&1
exit 0
}
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
