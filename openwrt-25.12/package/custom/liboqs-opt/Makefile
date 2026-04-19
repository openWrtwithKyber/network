# --- package/custom/liboqs/Makefile ---

include $(TOPDIR)/rules.mk

PKG_NAME:=liboqs
PKG_RELEASE:=1
PKG_VERSION:=1.0.0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/openWrtwithKyber/crypto.git
PKG_SOURCE_VERSION:=liboqs-alg_opt-neon_opt
PKG_MIRROR_HASH:=skip

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_SOURCE_SUBDIR:=liboqs-main

define Package/liboqs
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=liboqs - Kyber-768 matacc/neon Optimized
  DEPENDS:=+libopenssl
endef


CMAKE_OPTIONS += \
	-DOQS_MINIMAL_BUILD="KEM_kyber_768" \
	-DOQS_ENABLE_KEM_kyber_768_matacc=ON \
	-DBUILD_SHARED_LIBS=OFF \
	-DOQS_USE_OPENSSL=ON

TARGET_CFLAGS += -O3


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/oqs
	$(CP) $(PKG_INSTALL_DIR)/usr/include/oqs/*.h $(1)/usr/include/oqs/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liboqs.a $(1)/usr/lib/
endef


define Package/liboqs/install
	true
endef

$(eval $(call BuildPackage,liboqs))