# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LIBRETRO_REPO_NAME="libretro/libretro-fceumm"
LIBRETRO_COMMIT_SHA="58030a374d362b10f6c5af3d1d8fdfeb513dba2b"
inherit libretro-core

DESCRIPTION=" FCEUmm libretro port.  (Nintendo Entertainment System)"
HOMEPAGE="https://github.com/libretro/libretro-fceumm"
KEYWORDS="x86 amd64"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-info"

pkg_preinst() {
	if ! has_version "=${CATEGORY}/${PN}-${PVR}"; then
		first_install="1"
	fi
}

pkg_postinst() {
	if [[ "${first_install}" == "1" ]]; then
		ewarn ""
		ewarn "You need to have the following files in your 'system_directory' folder:"
		ewarn "disksys.rom (Famicom Disk System BIOS)"
		ewarn ""
		ewarn ""
	fi
}
