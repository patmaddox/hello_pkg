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
GH_TAGNAME= 56c6d2d4b89c35f09842db3f6ccf3da337161cdd

do-build:

do-install:
	$(INSTALL_SCRIPT) $(WRKSRC)/hello.sh $(STAGEDIR)$(PREFIX)/bin/
	cd $(STAGEDIR)$(PREFIX) && find * -type f -or -type l >> $(TMPPLIST)

.include <bsd.port.mk>
