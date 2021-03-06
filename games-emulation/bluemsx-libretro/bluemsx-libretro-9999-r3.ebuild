# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/blueMSX-libretro"
inherit libretro-core

DESCRIPTION=" Port of blueMSX to the libretro API"
HOMEPAGE="https://github.com/libretro/blueMSX-libretro"
KEYWORDS=""

LICENSE="bluemsx"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

