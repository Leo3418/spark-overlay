# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2

DESCRIPTION="Meta package for H2O, a distributed, fast & scalable machine learning platform"
HOMEPAGE="https://www.h2o.ai/"
SRC_URI=""
LICENSE="metapackage"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="flow +target-encoder"

# Meta package, no Java source is compiled, need not depend on JDK
DEPEND="
	>=virtual/jre-1.8:*
"

RDEPEND="
	${DEPEND}
	~dev-java/h2o-app-${PV}:${SLOT}
	~dev-java/h2o-jetty9-${PV}:${SLOT}
	flow? ( dev-java/h2o-flow:0 )
	target-encoder? ( ~dev-java/h2o-ext-target-encoder-${PV}:${SLOT} )
"

S="${WORKDIR}"

# Let the 'h2o-${SLOT}' command launch h2o-app
JAVA_MAIN_CLASS="water.H2OApp"
JAVA_LAUNCHER_FILENAME="${PN}-${SLOT}"

src_compile() {
	:
}

src_install() {
	java-pkg_register-dependency "h2o-app-${SLOT}"
	java-pkg_register-dependency "h2o-jetty9-${SLOT}"
	use flow && \
		java-pkg_register-dependency "h2o-flow"
	use target-encoder && \
		java-pkg_register-dependency "h2o-ext-target-encoder-${SLOT}"

	java-pkg_dolauncher "${JAVA_LAUNCHER_FILENAME}" --main "${JAVA_MAIN_CLASS}"
}
