# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/libretro-gme"
LIBRETRO_COMMIT_SHA="290d4dde6eb93cfb75d1c50d3d13a7f61cae1d20"
inherit libretro-core

DESCRIPTION="Port of blargg's Game_Music_Emu library."
HOMEPAGE="https://github.com/libretro/libretro-gme"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

