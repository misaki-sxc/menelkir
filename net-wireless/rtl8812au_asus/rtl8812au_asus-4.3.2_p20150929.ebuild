# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit linux-info linux-mod git-2

DESCRIPTION="Linux kernel module for ASUS USB-AC56"
HOMEPAGE="https://github.com/codeworkx/rtl8812au_asus/commits/master"
EGIT_REPO_URI="https://github.com/codeworkx/rtl8812au_asus.git"
EGIT_COMMIT="fc3150e6535ca496890aef19bb9b9bd749d79738"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
#IUSE="pax_kernel"

ARCH=x86_64
MODULE_NAMES="8812au(net/wireless:)"
BUILD_TARGETS="clean modules"

#src_prepare() {
#	use pax_kernel && epatch "${FILESDIR}"/rtl8812au_p2014_grsecurity.patch
#}
