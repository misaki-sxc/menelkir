# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/citra"
LIBRETRO_COMMIT_SHA="84f31e95160b029e6d614053705054ed6a34bb38"

#EGIT_OVERRIDE_REPO_FMTLIB_FMT="https://github.com/fmtlib/fmt"
EGIT_OVERRIDE_COMMIT_FMTLIB_FMT="c2ce7e4f07f7b34b2c7bbd0a4d0798b1d7007f4f"

#EGIT_OVERRIDE_REPO_HERUMI_XBYAK="https://github.com/herumi/xbyak"
EGIT_OVERRIDE_COMMIT_HERUMI_XBYAK="1de435ed04c8e74775804da944d176baf0ce56e2"

# These are used by citra and externals/dynarmic which seems to break with git-r3.eclass
EGIT_SUBMODULES=("*" "-externals/fmt" "-externals/xbyak")

inherit libretro-core cmake-utils git-r3

DESCRIPTION="libretro implementation of Citra. (Nintendo 3DS)"
HOMEPAGE="https://github.com/libretro/citra"
KEYWORDS="amd64 x86"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

RDEPEND="virtual/opengl
	media-libs/libpng:=
	sys-libs/zlib
	media-libs/libsdl2
	"
DEPEND="${DEPEND}"


src_configure() {
	local mycmakeargs=(
		-DENABLE_LIBRETRO="ON"
		-DENABLE_QT="OFF"
		-DENABLE_SDL2="OFF"
		-DENABLE_WEB_SERVICE="OFF"
		-DUSE_DISCORD_PRESENCE="ON"
	)
	cmake-utils_src_configure
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${WORKDIR}/${P}_build/src/${LIBRETRO_CORE_NAME}_libretro/${LIBRETRO_CORE_NAME}_libretro.so"
	libretro-core_src_install
}
