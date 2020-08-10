# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.persistence-2.1.0.pom --download-uri https://repo1.maven.org/maven2/org/eclipse/persistence/javax.persistence/2.1.0/javax.persistence-2.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-persistence-2.1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.persistence:javax.persistence:2.1.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="EclipseLink build based upon Git transaction 3faac2b"
HOMEPAGE="http://www.eclipse.org/eclipselink"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/persistence/javax.persistence/${PV}/javax.persistence-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/persistence/javax.persistence/${PV}/javax.persistence-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0"
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
	dev-java/osgi-framework:1
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-framework-1"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
