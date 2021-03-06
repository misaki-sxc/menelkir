# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
#inherit python-any-r1 cmake-utils virtualx multibuild git-r3
inherit cmake-utils git-r3

DESCRIPTION="Telegram binding for Qt"
HOMEPAGE="https://github.com/Kaffeine/telegram-qt"
EGIT_REPO_URI="https://github.com/Kaffeine/telegram-qt.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtnetwork:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-libs/openssl:0
		sys-libs/zlib:0

"
DEPEND="${RDEPEND}
	>=dev-util/cmake-2.8.12
"

DOCS=( LICENSE.LGPL README.md )

src_configure() {
	local mycmakeargs=(
		-D ENABLE_TESTS=FALSE
		-D ENABLE_TESTAPP=OFF
		-D STATIC_BUILD=OFF
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
