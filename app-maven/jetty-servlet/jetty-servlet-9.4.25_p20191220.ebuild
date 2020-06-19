# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-servlet-9.4.25.v20191220.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/jetty/jetty-servlet/9.4.25.v20191220/jetty-servlet-9.4.25.v20191220-sources.jar --slot 0 --keywords "~amd64" --ebuild jetty-servlet-9.4.25_p20191220.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty Servlet Container"
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/jetty/${PN}/9.4.25.v20191220/${PN}-9.4.25.v20191220-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.jetty:jetty-servlet:9.4.25.v20191220"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.4.25.v20191220.pom
# org.eclipse.jetty:jetty-jmx:9.4.25.v20191220 -> >=app-maven/jetty-jmx-9.4.28_p20200408:0
# org.eclipse.jetty:jetty-security:9.4.25.v20191220 -> >=app-maven/jetty-security-9.4.25_p20191220:0

CDEPEND="
	>=app-maven/jetty-jmx-9.4.28_p20200408:0
	>=app-maven/jetty-security-9.4.25_p20191220:0
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

JAVA_GENTOO_CLASSPATH="jetty-jmx,jetty-security"
