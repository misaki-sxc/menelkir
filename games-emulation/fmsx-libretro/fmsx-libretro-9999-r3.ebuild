# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/fmsx-libretro"
inherit libretro-core

DESCRIPTION="Port of fMSX to the libretro API."
HOMEPAGE="https://github.com/libretro/fmsx-libretro"
KEYWORDS=""

LICENSE="fMSX"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

