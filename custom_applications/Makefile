#based on modified SCADASim's makefile

all: checkmakefiles
	cd ddos && $(MAKE)

clean: checkmakefiles
	cd ddos && $(MAKE) clean

cleanall: checkmakefiles
	cd ddos && $(MAKE) MODE=release clean
	cd ddos && $(MAKE) MODE=debug clean
	rm -f ddos/Makefile

makefiles:
	cd ddos && opp_makemake -f --deep -I$(MYSQL_INCLUDE) -I$(INET_PROJ)/src/networklayer/rsvp_te -I$(INET_PROJ)/src/networklayer/common -I$(INET_PROJ)/src/networklayer/icmpv6 -I$(INET_PROJ)/src/transport/tcp -I$(INET_PROJ)/src/networklayer/mpls -I$(INET_PROJ)/src/networklayer/ted -I$(INET_PROJ)/src/networklayer/contract -I$(INET_PROJ)/src/util -I$(INET_PROJ)/src/transport/contract -I$(INET_PROJ)/src/linklayer/mfcore -I$(INET_PROJ)/src/networklayer/ldp -I$(INET_PROJ)/src/networklayer/ipv4 -I$(INET_PROJ)/src/base -I$(INET_PROJ)/src/util/headerserializers -I$(INET_PROJ)/src/networklayer/ipv6 -I$(INET_PROJ)/src/transport/sctp -I$(INET_PROJ)/src/world -I$(INET_PROJ)/src/applications/pingapp -I$(INET_PROJ)/src/linklayer/contract -I$(INET_PROJ)/src/networklayer/arp -I$(INET_PROJ)/src/transport/udp -I$(INET_PROJ)/src/networklayer/autorouting -I$(SCADASIM_PROJ)/src/base -I$(SCADASIM_PROJ)/src/networklayer/autorouting -I$(SCADASIM_PROJ)/src/networklayer/contract -I$(SCADASIM_PROJ)/src/networklayer/ipv4 -I$(SCADASIM_PROJ)/src/networklayer/queue -I$(SCADASIM_PROJ)/src/external -I$(SCADASIM_PROJ)/src/nodes/inet -I$(SCADASIM_PROJ)/src/nodes/scada -I$(SCADASIM_PROJ)/src/transport/contract -I$(SCADASIM_PROJ)/src/transport/tcp -I$(SCADASIM_PROJ)/src/transport/udp -I$(SCADASIM_PROJ)/src/util -I$(SCADASIM_PROJ)/src/applications/ddos $(MYSQL_LIBS) -L$(INET_PROJ)/src -linet -L$(SCADASIM_PROJ)/src -lscadasim

checkmakefiles:
	@if [ ! -f ddos/Makefile ]; then \
	echo; \
	echo '======================================================================='; \
	echo 'src/Makefile does not exist. Please use "make makefiles" to generate it!'; \
	echo '======================================================================='; \
	echo; \
	exit 1; \
	fi

#considering inet at the top dir
INET_PROJ="../../../inet"
#considering scadasim at the top dir
SCADASIM_PROJ="../../../scadasim"
MYSQL_INCLUDE=$(shell mysql_config --variable=pkgincludedir)
MYSQL_LIBS=$(shell mysql_config --libs)
