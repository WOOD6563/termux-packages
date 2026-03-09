TERMUX_PKG_HOMEPAGE=https://dwm.suckless.org/
TERMUX_PKG_DESCRIPTION="A dynamic window manager for X"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="6.8"
TERMUX_PKG_SRCURL="https://github.com/WOOD6563/Baka/releases/download/Dwm8/dwm-6.8.tar.gz"
TERMUX_PKG_SHA256=a159f49e6b5710b257ac7ad80441b441a2abf89ee424c021ff23ade4e4285ee9
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="dmenu, fontconfig, libx11, libxft, libxinerama, st"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	cp config.def.h config.h
}
