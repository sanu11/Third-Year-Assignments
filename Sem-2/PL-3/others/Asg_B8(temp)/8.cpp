#include<omp>
#include<iostream>
using namespace std;
int main()
{
	int v, e, i, j;
	cout<<"Enter the number of vertices.\n";
	cin>>v;
	
	int** adjmat = new int*[v];
	for(i = 0; i < v; ++i)
    	adjmat[i] = new int[v];

	cout<<"Creating adjacency matrix. If edge exists between vertices, enter weight, else enter 999.\n";
	
	for(i=0;i<v;i++)
	{
		for(j=i+1;j<v;j++)
		{
			cout<<i<<" to "<<j<<"\t";
			cin>>e;
			adjmat[i][j]=e;
			adjmat[j][i]=e;
		}		
	}

	cout<<"Adjacency matrix has been created!\n";

	int* nodestatus=new int[v];
	for(i=0;i<v;i++)
	{
		nodestatus[i]=0;
	}

	cout<<"Enter starting vertex.\n";
	int start;
	cin>>start;
	nodestatus[start]=1;

	int vertex1, vertex2, count=0, currentmin, minweight=0;

	while(count<v-1)
	{
		currentmin=999;
		#pragma omp parallel num_threads(5)
		for(i=0;i<v;i++)
		{
			if(nodestatus[i]==1)
			{
			for(j=0;j<v;j++)
				{
					if((nodestatus[j]==0) && (currentmin>adjmat[i][j]))
					{
						currentmin=adjmat[i][j];
						vertex1=i;
						vertex2=j;
					}
				}
			}
		}
		nodestatus[vertex2]=1;
		minweight+=adjmat[vertex1][vertex2];
		cout<<vertex2<<" -> ";
		
		count++;
	}
	cout<<"\n"<<"Weight="<<minweight;
	return 0;
}
