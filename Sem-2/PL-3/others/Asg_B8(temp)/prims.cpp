#include<bits/stdc++.h>
using namespace std;
#define max 999
int main()
{
int n,min=max;
scanf("%d",&n);
int arr[n+1][n+1];
int vi[n+1];
int from[n+1];
memset(vi,0,sizeof(vi));
memset(from,999,sizeof(from));

//ajacency matrix as input
for(int i=1;i<=n;i++)
for(int j=1;j<=	n;j++)
{
scanf("%d",&arr[i][j]);
if(arr[i][j]==0)
arr[i][j]=max;
}
vi[1]=1;
int k,l,c=0;
while(c!=n-1)
{                                       //0 2 3 6 5 
					//2 0 4 0 0 
				        //3 4 0 1 0
					//0 0 1 0 7 
					//5 0 0 7 0

for(int i=1;i<=n;i++)
{
min=max;
if(vi[i]==1)
for(int j=2;j<=n;j++)
{
if(arr[i][j]<min)
{
min=arr[i][j];
k=j;
l=i;
}
}
}
arr[l][k]=max;
vi[k]=1;
from[k]=l;
c++;
}
cout<<"FROM"<<endl;
for(int i=1;i<=n;i++)
cout<<i<<" "<<from[i]<<endl;
cout<<"VISITED!"<<endl;
for(int i=1;i<=n;i++)
cout<<i<<" "<<vi[i]<<endl;

return 0;
}
