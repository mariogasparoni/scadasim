#SCADASim's makefile modified to generate a shared lib.

all: checkmakefiles
	cd src && $(MAKE)

clean: checkmakefiles
	cd src && $(MAKE) clean

cleanall: checkmakefiles
	cd src && $(MAKE) MODE=release clean
	cd src && $(MAKE) MODE=debug clean
	rm -f src/Makefile

makefiles: buildlib

buildlib:
	cd src && opp_makemake -f --deep --make-so -o scadasim -I$(MYSQL_INCLUDE) -I$(INET_PROJ)/src/networklayer/rsvp_te -I$(INET_PROJ)/src/networklayer/common -I$(INET_PROJ)/src/networklayer/icmpv6 -I$(INET_PROJ)/src/transport/tcp -I$(INET_PROJ)/src/networklayer/mpls -I$(INET_PROJ)/src/networklayer/ted -I$(INET_PROJ)/src/networklayer/contract -I$(INET_PROJ)/src/util -I$(INET_PROJ)/src/transport/contract -I$(INET_PROJ)/src/linklayer/mfcore -I$(INET_PROJ)/src/networklayer/ldp -I$(INET_PROJ)/src/networklayer/ipv4 -I$(INET_PROJ)/src/base -I$(INET_PROJ)/src/util/headerserializers -I$(INET_PROJ)/src/networklayer/ipv6 -I$(INET_PROJ)/src/transport/sctp -I$(INET_PROJ)/src/world -I$(INET_PROJ)/src/applications/pingapp -I$(INET_PROJ)/src/linklayer/contract -I$(INET_PROJ)/src/networklayer/arp -I$(INET_PROJ)/src/transport/udp -I$(INET_PROJ)/src/networklayer/autorouting $(MYSQL_LIBS) -L$(INET_PROJ)/src -linet

buildbinary:
	cd src && opp_makemake -f --deep -o scadasim -I$(MYSQL_INCLUDE) -I$(INET_PROJ)/src/networklayer/rsvp_te -I$(INET_PROJ)/src/networklayer/common -I$(INET_PROJ)/src/networklayer/icmpv6 -I$(INET_PROJ)/src/transport/tcp -I$(INET_PROJ)/src/networklayer/mpls -I$(INET_PROJ)/src/networklayer/ted -I$(INET_PROJ)/src/networklayer/contract -I$(INET_PROJ)/src/util -I$(INET_PROJ)/src/transport/contract -I$(INET_PROJ)/src/linklayer/mfcore -I$(INET_PROJ)/src/networklayer/ldp -I$(INET_PROJ)/src/networklayer/ipv4 -I$(INET_PROJ)/src/base -I$(INET_PROJ)/src/util/headerserializers -I$(INET_PROJ)/src/networklayer/ipv6 -I$(INET_PROJ)/src/transport/sctp -I$(INET_PROJ)/src/world -I$(INET_PROJ)/src/applications/pingapp -I$(INET_PROJ)/src/linklayer/contract -I$(INET_PROJ)/src/networklayer/arp -I$(INET_PROJ)/src/transport/udp -I$(INET_PROJ)/src/networklayer/autorouting $(MYSQL_LIBS) -L$(INET_PROJ)/src -linet

checkmakefiles:
	@if [ ! -f src/Makefile ]; then \
	echo; \
	echo '======================================================================='; \
	echo 'src/Makefile does not exist. Please use "make makefiles" to generate it!'; \
	echo '======================================================================='; \
	echo; \
	exit 1; \
	fi

INET_PROJ="../../inet"
MYSQL_INCLUDE=$(shell mysql_config --variable=pkgincludedir)
MYSQL_LIBS=$(shell mysql_config --libs)
