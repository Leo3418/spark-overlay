# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hk2-utils-2.6.1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/hk2/hk2-utils/2.6.1/hk2-utils-2.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hk2-utils-2.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="HK2 Implementation Utilities"
HOMEPAGE="https://github.com/eclipse-ee4j/glassfish-hk2/hk2-utils"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2:hk2-utils:2.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml:classmate:1.3.3 -> >=dev-java/classmate-1.5.1:0
# jakarta.annotation:jakarta.annotation-api:1.3.4 -> >=app-maven/jakarta-annotation-api-2.0.0:0
# javax.validation:validation-api:2.0.1.Final -> >=dev-java/validation-api-2.0.1:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=app-maven/jakarta-inject-2.6.1:0
# org.hibernate.validator:hibernate-validator:6.0.10.Final -> >=app-maven/hibernate-validator-7.0.0:0
# org.jboss.logging:jboss-logging:3.3.1.Final -> >=dev-java/jboss-logging-3.4.1:0

CDEPEND="
	>=app-maven/hibernate-validator-7.0.0:0
	>=app-maven/jakarta-annotation-api-2.0.0:0
	>=app-maven/jakarta-inject-2.6.1:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/jboss-logging-3.4.1:0
	>=dev-java/validation-api-2.0.1:0
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

JAVA_GENTOO_CLASSPATH="classmate,jakarta-annotation-api,validation-api,jakarta-inject,hibernate-validator,jboss-logging"
