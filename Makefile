include $(TOPDIR)/rules.mk

PKG_NAME:=hellodutsai
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/hellodutsai
	SECTION:=base
	CATEGORY:=Extras
	TITLE:=A simple Hello, World! program
endef

define Package/hellodutsai/description
	A simple Hello, World! program that prints to the console.
endef

define Build/Prepare
mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/hellodutsai/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hellodutsai $(1)/usr/bin/
endef

$(eval $(call BuildPackage,hellodutsai))
