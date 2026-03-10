TERMUX_PKG_HOMEPAGE=https://dwm.suckless.org/
TERMUX_PKG_DESCRIPTION="A dynamic window manager for X"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="6.8"
TERMUX_PKG_SRCURL="https://github.com/WOOD6563/Baka/releases/download/Dwm8/dwm-6.8.tar.gz"
TERMUX_PKG_SHA256=e9f4c56d12ca02eb3aa8cf5c35e6c737a32d9324cd44cbcebfeddcabdaedbdd2
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="dmenu, fontconfig, libx11, libxft, libxinerama, st"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	cp config.def.h config.h
}
