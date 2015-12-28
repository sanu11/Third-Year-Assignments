#!/bin/sh

MONITOREDIP='192.168.5.21'

/usr/local/bin/honeyd -f /usr/local/share/honeyd/honeyd.conf \
	-p /usr/local/share/honeyd/nmap.prints \
	-x /usr/local/share/honeyd/xprobe2.conf \
	-a /usr/local/share/honeyd/nmap.assoc \
	-g 99 -u 99 \
	-l /var/log/honeyd \
	--disable-webserver \
	$MONITOREDIP
