TERMUX_PKG_HOMEPAGE=https://github.com/KhronosGroup/Vulkan-ExtensionLayer
TERMUX_PKG_DESCRIPTION="Vulkan Tools and Utilities"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="xMeM <haooy@outlook.com>"
TERMUX_PKG_VERSION="0.0.1-r113.3b88663"
TERMUX_PKG_SRCURL=git+https://github.com/twaik/vulkan-wsi-layer
TERMUX_PKG_SHA256="a5892c8a426c53bbbcfce4ff1e9dbc98a5b3ecd8ac824a8a6955483aab6e501b"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BUILD_DEPENDS="vulkan-headers, vulkan-loader-generic"
TERMUX_PKG_RECOMMENDS="vulkan-loader-generic"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_POLICY_VERSION_MINIMUM=3.5
-DVULKAN_HEADERS_INSTALL_DIR=$TERMUX_PREFIX
-DCMAKE_CXX_STANDARD=20
"

termux_step_post_get_source() {
	git fetch --unshallow

	local version="$(printf "0.0.1-r%d.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)")"

	if [ "$version" != "$TERMUX_PKG_VERSION" ]; then
		echo -n "ERROR: The specified version \"$TERMUX_PKG_VERSION\""
		echo " is different from what is expected to be: \"$version\""
		return 1
	fi

	local s=$(find . -type f ! -path '*/.git/*' -print0 \
		| xargs -0 sha256sum \
		| LC_ALL=C sort \
		| sha256sum)

	echo "$s"

	if [[ "${s}" != "${TERMUX_PKG_SHA256}  "* ]]; then
		termux_error_exit "Checksum mismatch for source files."
	fi
}
