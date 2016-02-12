from scapy.all import *
from multiprocessing import Process

def pkt_callback(pkt):
	pkt.show()
 
def tcp():
    print "Core 1"
    sniff(count=3,iface="p4p1", prn=pkt_callback, filter="tcp", store=0)

def udp():
    print "Core 2"
    sniff(count=3,iface="p4p1", prn=pkt_callback, filter="udp", store=0)
   
def ip():
    print "Core 3"
    sniff(count=3,iface="p4p1", prn=pkt_callback, filter="ip", store=0)
   
def main():
   
    p1 = Process(target=tcp)
    p2 = Process(target=udp)
    p3 = Process(target=ip)
    p1.start()
    p2.start()
    p3.start()
  


if __name__=='__main__':
    main()
