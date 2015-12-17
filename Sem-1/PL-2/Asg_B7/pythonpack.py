#!/usr/bin/env python
from scapy.all import *
packetCount=0
SYN = 0x02
j=0
k=0
msg=""
Matrix = [[0 for x in xrange(21)] for x in xrange(21)]

def customAction(packet):
	global packetCount,i,j,k,SYN,msg
	packetCount+=1
	if hasattr(packet.payload, "src") and k<20:
		for i in range(len(Matrix)):
			j=0
			if Matrix[i][0]==str(packet.payload.src):
				Matrix[i][1]+=1
				j=1
			if j==0 and k<19:
				k+=1
				F = packet['TCP'].flags
				if F & SYN:
					Matrix[k][2]=7
				Matrix[k][0]=str(packet.payload.src)
				Matrix[k][1]+=1
	#print str(packet.payload.src)

	for i in range(len(Matrix)):
		if Matrix[k][2]==7:
			msg="syn present"
		print str(Matrix[i][0])+"count:"+str(Matrix[i][1])+msg
		msg=""
		if(Matrix[i][1]>99):
			print "syn attack!"
		#return "Packet#:"+str(packetCount)
sniff(filter="tcp", prn=customAction)
