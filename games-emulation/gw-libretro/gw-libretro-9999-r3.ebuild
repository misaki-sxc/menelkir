# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/gw-libretro"
inherit libretro-core

DESCRIPTION="A libretro core for Game & Watch simulators."
HOMEPAGE="https://github.com/libretro/gw-libretro"
KEYWORDS=""

LICENSE="ZLIB"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

