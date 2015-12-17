import socket, sys
from struct import *
i=0
s = socket.socket( socket.AF_PACKET , socket.SOCK_RAW , socket.ntohs(0x0003))
# receive a packet
while i<1000:
	packet = s.recvfrom(65565)
	#packet string from tuple
	packet = packet[0]
	#parse ethernet header
	eth_length = 14
	eth_header = packet[:eth_length]
	eth = unpack('!6s6sH' , eth_header)
	eth_protocol = socket.ntohs(eth[2])
	#Parse IP packets, IP Protocol number = 8
	if eth_protocol == 8 :
		ip_header = packet[eth_length:20+eth_length]
		#now unpack them :)
		iph = unpack('!BBHHHBBH4s4s' , ip_header)
		version_ihl = iph[0]
		version = version_ihl >> 4
		ihl = version_ihl & 0xF
		iph_length = ihl * 4
		ttl = iph[5]
		protocol = iph[6]
		s_addr = socket.inet_ntoa(iph[8]);
		d_addr = socket.inet_ntoa(iph[9]);
		if str(d_addr)=="127.0.0.1":
			print ' Source Address : ' + str(s_addr) + ' Destination Address : ' + str(d_addr)
	i+=1
print "attack detected"
