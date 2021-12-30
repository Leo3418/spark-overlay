# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-virtuals-2

DESCRIPTION="Virtual for Transaction API (javax.transaction)"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ppc64 x86"
IUSE=""

DEPEND=""
RDEPEND="|| (
			dev-java/glassfish-transaction-api:0
			dev-java/jta:0
		)
		"

JAVA_VIRTUAL_PROVIDES="glassfish-transaction-api jta"

MAVEN_PROVIDES="javax.transaction:transaction-api:1.1 org.jboss.javaee:jboss-transaction-api:1.0.1"
