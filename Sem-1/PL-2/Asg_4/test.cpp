#include <iostream>

#include <crafter.h>



/* Collapse namespaces */

using namespace std;

using namespace Crafter;



int main() {

        /* Set the interface */

        string iface = "eth0";



        /* Get the IP address associated to the interface */

        string MyIP = GetMyIP(iface);

        cout << "[@] My IP address is  : " << MyIP  << endl;



        /* Create an IP header */

        IP ip_header;

        /* Set the Source and Destination IP address */

        ip_header.SetSourceIP("192.168.5.12");

        ip_header.SetDestinationIP("192.168.0.118");



        /* Create an TCP - SYN header */

        TCP tcp_header;

        tcp_header.SetSrcPort(11);

        tcp_header.SetDstPort(90);

        tcp_header.SetSeqNumber(RNG32());

        tcp_header.SetFlags(TCP::SYN);



        /* A raw layer, this could be any array of bytes or chars */

        RawLayer payload("ArbitraryPayload");



        /* Create a packets */

        Packet tcp_packet = ip_header / tcp_header / payload;



        cout << endl << "[@] Packet sending: " << endl;

       

        tcp_packet.Send();



         

        return 0;

}

