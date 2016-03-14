from scapy.all import *
from multiprocessing import Process

def pkt_callback(pkt):
	print "\n\nCore1\n\n"
	pkt.show()
	
def pkt_callback2(pkt):
	print "\n\nCore2\n\n"
	pkt.show()

def pkt_callback3(pkt):
	print "\n\nCore3\n\n"
	pkt.show()

 
def tcp():
    sniff(count=3,iface="p4p1", prn=pkt_callback, filter="tcp", store=0)

def udp():
    sniff(count=3,iface="p4p1", prn=pkt_callback2, filter="udp", store=0)
   
def ip():
    sniff(count=3,iface="p4p1", prn=pkt_callback3, filter="ip", store=0)
   
def main():
   
    p1 = Process(target=tcp)
    p2 = Process(target=udp)
    p3 = Process(target=ip)
    p1.start()
    p2.start()
    p3.start()
  


if __name__=='__main__':
    main()
