# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/libretro-vecx"
LIBRETRO_COMMIT_SHA="4c6d2f86d2af9172618d4b77471cfb4f4ca6ee05"

inherit libretro-core

DESCRIPTION="Libretro adaption of vecx, a Vectrex Emulator"
HOMEPAGE="https://github.com/libretro/libretro-vecx"
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

