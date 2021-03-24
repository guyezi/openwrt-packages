include $(TOPDIR)/rules.mk

PKG_NAME:=smartdns-le
PKG_VERSION:=6.2020.33
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://www.github.com/pymumu/smartdns.git
#PKG_SOURCE_VERSION:=Release31
PKG_SOURCE_VERSION:=Release33
#PKG_SOURCE_VERSION:=86902d2e3415666246dae0286262e43923f58532
#PKG_MIRROR_HASH:=d5affc45a533e38ee04f3ce47b441aecf316cb9cb68ff410eede67090ec0fcc7

PKG_MAINTAINER:=Nick Peng <pymumu@gmail.com>
PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

MAKE_VARS += VER=$(PKG_VERSION) 
MAKE_PATH:=src

define Package/smartdns-le
  SECTION:=net
  CATEGORY:=Network
  TITLE:=smartdns server
  DEPENDS:=+libc +libpthread +libopenssl
  URL:=https://www.github.com/pymumu/smartdns/
endef

define Package/smartdns-le/description
SmartDNS is a local DNS server which accepts DNS query requests from local network clients,
gets DNS query results from multiple upstream DNS servers concurrently, and returns the fastest IP to clients.
Unlike dnsmasq's all-servers, smartdns returns the fastest IP. 
endef

define Package/smartdns-le/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/smartdns $(1)/usr/sbin/smartdns
endef

$(eval $(call BuildPackage,smartdns-le))
