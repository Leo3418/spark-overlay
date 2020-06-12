# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-text-1.8.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-text/1.8/commons-text-1.8-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-text-1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Commons Text is a library focused on algorithms working on strings."
HOMEPAGE="https://commons.apache.org/proper/commons-text"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-text:1.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.10:3

CDEPEND="
	>=dev-java/commons-lang-3.10:3
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="ISO-8859-1"

JAVA_GENTOO_CLASSPATH="commons-lang-3"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
