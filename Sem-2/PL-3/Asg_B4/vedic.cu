#include<stdio.h>
#include<cuda.h>
__global__ void square(int *arr)
{
__shared__ int a[2];
int id=threadIdx.x;
if(id==0)
{
a[0]=arr[0]+arr[2];
}
else
a[1]=arr[2]*arr[2];
__syncthreads();
for(int i=0;i<2;i++)
{
arr[i+3]=a[i];
}
arr[5]=(a[0]*arr[1])+a[1];
}
int main()
{
int n=6,a[n],b[n],no,x,y;
printf("Enter the number:-");
scanf("%d",&no);
if(no<=55)
{
	x=10;
}
else
	x=100;
y=no-x;
a[0]=no;
a[1]=x;
a[2]=y;
printf("\nValue of deviation is: %d",y);
int *d_d;
cudaMalloc((void**)&d_d,n*sizeof(int));
cudaMemcpy(d_d,a,n*sizeof(int),cudaMemcpyHostToDevice);
square <<<1,2>>> (d_d);
cudaMemcpy(b,d_d,n*sizeof(int),cudaMemcpyDeviceToHost);
printf("\nd_d:%d",d_d);
printf("\nOUTPUT FOR 1ST THREAD(number+deviation):%d\t",b[3]);
printf("\nOUTPUT FOR 2nd THREAD(deviation*deviation):%d\t",b[4]);
printf("\nSQUARE OF %d : %d",no,b[5]);
cudaFree(d_d);
return 0;
}
