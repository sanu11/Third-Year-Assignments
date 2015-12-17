#include <iostream>
#include <string>
#include <cstdlib>
#include <vector>
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/applications-module.h"
#include "ns3/animation-interface.h"
#include "ns3/wifi-module.h"
#include "ns3/mobility-module.h"
//#include "ns3/aodv-helper.h" //change this  include file for dsdv and dsr routing protocols
#include "ns3/olsr-helper.h"
#include "ns3/flow-monitor-module.h"

using namespace ns3;
NS_LOG_COMPONENT_DEFINE ("WifiAdhoc_Routing");
int main(int argc,char** argv) {


std::string phyMode ("DsssRate1Mbps");
std::string DataRate ("1Kbps");
uint16_t num_node = 3;
NodeContainer node;
node.Create (num_node);
WifiHelper wifi;
YansWifiPhyHelper wifiPhy = YansWifiPhyHelper::Default ();
wifiPhy.Set ("RxGain", DoubleValue (-12) );
wifiPhy.SetPcapDataLinkType (YansWifiPhyHelper::DLT_IEEE802_11_RADIO);
YansWifiChannelHelper wifiChannel;
wifiChannel.SetPropagationDelay("ns3::ConstantSpeedPropagationDelayModel");
wifiChannel.AddPropagationLoss("ns3::FriisPropagationLossModel");
wifiPhy.SetChannel (wifiChannel.Create ());
NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
wifi.SetStandard (WIFI_PHY_STANDARD_80211b);
wifi.SetRemoteStationManager("ns3::ConstantRateWifiManager","DataMode",StringValue(phyMode), "ControlMode",StringValue (phyMode));
wifiMac.SetType ("ns3::AdhocWifiMac");
NetDeviceContainer Devices;
Devices = wifi.Install (wifiPhy, wifiMac, node);
AnimationInterface anim ("animation.xml");
anim.EnablePacketMetadata (true);
AsciiTraceHelper ascii;

wifiPhy.EnableAsciiAll (ascii.CreateFileStream ("out.tr"));
MobilityHelper mobility;
Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator>();
positionAlloc ->Add(Vector(0, 0, 0));
positionAlloc ->Add(Vector(0, 50, 0));
positionAlloc ->Add(Vector(0, 100, 0));
mobility.SetPositionAllocator(positionAlloc);
mobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
mobility.Install (node);
// change following 5 line code for dsdv and dsr routing protocols
//AodvHelper aodv;
//Ipv4StaticRoutingHelper staticRouting;
//Ipv4ListRoutingHelper list;
//list.Add (staticRouting, 0);
//list.Add (aodv, 10);
// change above 5 line code for dsdv and dsr routing protocols
//----------------OLSR----------------------
OlsrHelper olsr;
Ipv4StaticRoutingHelper staticRouting;
Ipv4ListRoutingHelper list;
list.Add (staticRouting, 0);
list.Add (olsr, 10);
//---------------OLSR-----------------------


InternetStackHelper internet;
internet.SetRoutingHelper (list);
internet.Install (node);
Ipv4AddressHelper ipv4;
ipv4.SetBase ("192.168.1.0", "255.255.255.0");
Ipv4InterfaceContainer i;
i = ipv4.Assign (Devices);
uint16_t UDPport = 4000;
PacketSinkHelper UDPsink ("ns3::UdpSocketFactory", InetSocketAddress(Ipv4Address::GetAny (), UDPport));
NodeContainer SourceNode = NodeContainer (node.Get (0));
NodeContainer SinkNode = NodeContainer (node.Get (2));
ApplicationContainer App;
App = UDPsink.Install(SinkNode);
App.Start (Seconds (30.0));
App.Stop (Seconds (60.0));
OnOffHelper UDPsource ("ns3::UdpSocketFactory", InetSocketAddress(i.GetAddress(2,0), UDPport));
UDPsource.SetAttribute ("OnTime", StringValue ("ns3::ConstantRandomVariable[Constant=1]"));
UDPsource.SetAttribute ("OffTime", StringValue ("ns3::ConstantRandomVariable[Constant=0]"));
App = UDPsource.Install(SourceNode);

App.Start (Seconds (30.0));
App.Stop (Seconds (60.0));
FlowMonitorHelper flowmon;
Ptr<FlowMonitor> monitor = flowmon.InstallAll ();
// wifiPhy.EnablePcap ("out", Devices);
Simulator::Stop(Seconds(100.0));
Simulator::Run();
monitor->CheckForLostPackets();
Ptr<Ipv4FlowClassifier> classifier =
DynamicCast<Ipv4FlowClassifier>(flowmon.GetClassifier());
std::map<FlowId,FlowMonitor::FlowStats>stats = monitor->GetFlowStats();
for(std::map<FlowId,FlowMonitor::FlowStats>::const_iterator i = stats.begin();i!=stats.end();i++)
{
Ipv4FlowClassifier::FiveTuple t = classifier->FindFlow(i->first);
std::cout<<" Flow "<<i->first<<"("<<t.sourceAddress<<"->"<<t.destinationAddress<<")\n";
std::cout<<" Tx Bytes: \t\t"<<i->second.txBytes<<"\n";
std::cout<<" Rx Bytes: \t\t"<<i->second.rxBytes<<"\n";
std::cout<<" Tx Packets: \t\t"<<i->second.txPackets<<"\n";
std::cout<<" Rx Packets: \t\t"<<i->second.rxPackets<<"\n";
std::cout<<" Packet Delivery Ratio: "<<(float)i->second.rxPackets/i->second.txPackets*100<<"\n";
std::cout<<" Throughput: \t\t"<<i->second.rxBytes*8.0/30.0 <<"bits/sec\n";
std::cout<<" Average Delay: \t"<<i->second.delaySum/i->second.rxPackets<<"\n";
std::cout<<" Average Jitter: \t"<<i->second.jitterSum/i->second.rxPackets<<"\n";
std::cout<<" Dropped Packets: \t"<<(i->second.txPackets-i->second.rxPackets)<<"\n";
std::cout<<" Dropping Ratio: \t"<<(float)(i->second.txPackets-i->second.rxPackets)/i->second.txPackets*100<<"\n";
}
Simulator::Destroy();
return 0;
}


