# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/t-digest-3.1.pom --download-uri https://repo1.maven.org/maven2/com/tdunning/t-digest/3.1/t-digest-3.1-sources.jar --slot 0 --keywords "~amd64" --ebuild t-digest-3.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.tdunning:t-digest:3.1"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Data structure which allows accurate estimation of quantiles and related rank statistics"
HOMEPAGE="https://github.com/tdunning/t-digest"
SRC_URI="https://repo1.maven.org/maven2/com/tdunning/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/tdunning/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
