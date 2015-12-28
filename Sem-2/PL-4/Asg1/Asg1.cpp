#include<bits/stdc++.h>
#include<crafter.h>
using namespace std;
using namespace Crafter;

/*declaring variables to store the count*/

int rescnt=0,reqcnt=0,cnt=0,pktcnt=0;
map<string,int>mp;

/*defining methods for capturing and analyzing the packets*/ 
ofstream file;
void PacketHandler(Packet* sniff_packet, void* user)
{
	
	RawLayer* raw_layer_payload=sniff_packet->GetLayer<RawLayer>();
	if(raw_layer_payload)
	{		
		pktcnt++;
		
		/*getting payload as a string*/

		string payload=raw_layer_payload->GetStringPayload();
//size_t gives index of string found ..	
	std::size_t http_succ=payload.find("HTTP/1.1");	
		if(http_succ)
			file<<payload<<endl;

		std::size_t get=payload.find("GET");
		std::size_t post=payload.find("POST");
		std::size_t connect=payload.find("CONNECT");
				
		
	//npos means not found here.

		if(get==std::string::npos && post==std::string::npos && connect==std::string::npos)
		{
			rescnt++;
			//cout<<"Response packet!";
			
		}
		else
		{
			reqcnt++;
std ::size_t a= payload.find("Host:");
std ::size_t b=payload.find("User-Agent:");
std::string token = payload.substr(a,b-a);
//cout<<token<<endl;	 
std ::size_t c=token.find(":");
std::string host = token.substr(c+1,token.length()); 
//cout<<host;
map<string,int>::iterator p;
p=mp.find(host);
if(p==mp.end())
mp.insert(make_pair(host,1));
else
p->second++;
}
}
}

int main()
{
	string iface="p4p1";
	 file.open("sample.txt");

	/*creating a sniffer*/
	Sniffer sniff("tcp and port 3128",iface,PacketHandler);

	sniff.Capture(100);

	cout<<"total packets sniffed:"<<pktcnt<<endl;
	cout<<"total request packets:"<<reqcnt<<endl;
	cout<<"total response packets:"<<rescnt<<endl;
map<string,int>::iterator p=mp.begin();
while(p!=mp.end())
{
cout<<p->first<<" "<<p->second<<endl;
 p++;
} 
	return 0;
}
