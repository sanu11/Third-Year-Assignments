#include <iostream>
#include <string>
#include <crafter.h>
#include<cstring>
using namespace std;
using namespace Crafter;
int requestcount=0;
int responsecount=0;
char text[5000];
char pattern1[100]={"HTTP"};
char pattern2[100]={"GET"};
char pattern3[100]={"POST"};
char pattern4[100]={"HEAD"};
char pattern5[100]={"TRACE"};
char pattern6[100]={"PUT"};
char pattern7[100]={"CONNECT"};

int match(char text[], char pattern[]) {
  int c, d, e, text_length, pattern_length, position = -1;
 
  text_length    = strlen(text);
  pattern_length = strlen(pattern);
 
  if (pattern_length > text_length) {
    return -1;
  }
 
  for (c = 0; c <= text_length - pattern_length; c++) {
    position = e = c;
 
    for (d = 0; d < pattern_length; d++) {
      if (pattern[d] == text[e]) {
        e++;
      }
      else {
        break;
      }
    }
    if (d == pattern_length) {
      return position;
    }
  }
 
  return -1;
}
void Sniffer1(Packet* packet, void* user)
 {
     
        RawLayer* raw_payload = packet->GetLayer<RawLayer>();
        if(raw_payload)
	{

                cout << "[+] ------- [+]" << endl;
                TCP* tcp_layer = packet->GetLayer<TCP>();
                cout << "[#] TCP packet from source port: " << tcp_layer->GetSrcPort() << endl;


		cout << "[#] TCP packet from destination port: " << tcp_layer->GetDstPort() << endl;
                cout << "[#] With Payload: " << endl;
                /* You can get the payload as a string */
                string payload = "";
		payload=raw_payload->GetStringPayload();
		stringstream ss(payload);
		string line;
		getline(ss,line);
                cout <<line<< endl<<endl;
		int len=payload.length();
		for(int i=0;i<payload.length();i++)
		{
			text[i]=payload.at(i);
			
		}
		
		int header=-1;
		header=match(text,pattern1);
		if(header>=0)
			cout<<"It is HTTP Header\n";
	 	
		else
		{
			cout<<"Its is not a HTTP Header\n";
cout<<"==================================================================";
			return;
		}
		//cout<<header<<"\n\n";
		if( header==0){
			cout<<"Its is HTTP Response\n";
			responsecount++;}
		else{
			cout<<"Its is HTTP Request\n";
			requestcount++;}

		int type=0;
if(header!=0){
		type=match(text,pattern3);
		if(type>=0){
			cout<<"POST--Send Data From Client To Server\n";
cout<<"==================================================================";
			return;}
		type=match(text,pattern4);
		if(type>=0){
			cout<<"HEAD--It is Req Info of Document \n";
cout<<"==================================================================";
			return;}
		type=match(text,pattern2);
		if(type>=0){
			cout<<"GET--Request Document from server\n";
cout<<"==================================================================";
			return;}
		type=match(text,pattern6);
		if(type>=0){
			cout<<"PUT--Send Document from Server to Clients\n";
cout<<"==================================================================";
			return;}
		type=match(text,pattern5);
		if(type>=0){
			cout<<"TRACE--Echo Incoming Request\n";
			cout<<"==================================================================";
			return;}
		type=match(text,pattern6);
		if(type>=0){
			cout<<"CONNECT--\n";
			cout<<"==================================================================";
			return;}
}
        }
cout<<"==================================================================";
}



int main() {

        /* Set the interface */
        string iface = "p4p1";

        Sniffer sniff("tcp",iface,Sniffer1);

        sniff.Capture(10);
	system("/bin/echo 0 > /proc/sys/net/ipv4/ip_forward");

	cout<<"\nRequest Count"<<requestcount<<endl;
	cout<<"Response Count"<<responsecount<<endl;

        return 0;
} 



