PORTNAME= hello_pkg
PORTVERSION= 0.1.0
CATEGORIES= devel

MAINTAINER= pat@patmaddox.com
COMMENT= no comment

CONFLICTS_INSTALL= hello_pkg*
NO_CHECKSUM= yes

USE_GITHUB= yes
GH_ACCOUNT= patmaddox
GH_PROJECT= hello_pkg
#GH_TAGNAME= tbd

do-install:
	cp ${WRKSRC}/hello.sh ${STAGEDIR}${PREFIX}/bin/
	cd $(STAGEDIR)$(PREFIX) && find * -type f -or -type l >> $(TMPPLIST)

.include <bsd.port.mk>
