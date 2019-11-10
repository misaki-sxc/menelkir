# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CMAKE_USE_DIR="${S}/src/MEGAShellExtDolphin"
CMAKE_IN_SOURCE_BUILD=y
inherit gnome2 cmake-utils qmake-utils
inherit git-r3
EGIT_REPO_URI="https://github.com/meganz/${PN}.git"
EGIT_SUBMODULES=( -src/MEGASync/mega )
SRC_URI=
KEYWORDS=""

DESCRIPTION="Easy automated syncing with MEGA Cloud Drive"
HOMEPAGE="https://github.com/meganz/MEGAsync"

LICENSE="EULA"
LICENSE_URL="https://raw.githubusercontent.com/meganz/MEGAsync/master/LICENCE.md"
SLOT="0"
IUSE="dolphin nautilus thunar"

RDEPEND="
	>=net-misc/meganz-sdk-3.5.4:=[libuv,qt,sodium(+),sqlite]
	dev-qt/qtsvg:5
	dev-qt/qtdbus:5
	dev-qt/qtconcurrent:5
	dev-qt/qtimageformats:5
	dolphin? ( kde-apps/dolphin )
	nautilus? ( >=gnome-base/nautilus-3 )
	thunar? ( xfce-base/thunar )
"
DEPEND="
	${RDEPEND}
	dev-qt/linguist-tools:5
"
src_prepare() {
	cp -r "${EROOT}"usr/share/meganz-sdk/bindings "${S}"/src/MEGASync/mega/
	cmake-utils_src_prepare
	mv -f src/MEGAShellExtDolphin/CMakeLists{_kde5,}.txt
	rm -f src/MEGAShellExtDolphin/megasync-plugin.moc
	sed \
		-e "/USE_\(FFMPEG\|LIBRAW\|MEDIAINFO\)/s:+:-:" \
		-i src/MEGASync/MEGASync.pro
}

src_configure() {
	cd src
	local eqmakeargs=(
		CONFIG$(usex nautilus + -)=with_ext
		CONFIG$(usex thunar + -)=with_thu
		CONFIG-=with_updater
		CONFIG-=with_tools
	)
	eqmake5 "${eqmakeargs[@]}"
	use dolphin && cmake-utils_src_configure
}

src_compile() {
	cd src
	$(qt5_get_bindir)/lrelease \
		MEGASync/MEGASync.pro
	emake
	use dolphin && cmake-utils_src_compile
}

src_install() {
	local DOCS=( CREDITS.md README.md )
	einstalldocs
	emake -C src INSTALL_ROOT="${D}" install
	use dolphin && cmake-utils_src_install
}
