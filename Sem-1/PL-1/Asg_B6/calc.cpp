
#include<stdio.h>
#include<stdlib.h>
#include<iostream.h>
int main()
{
int a,b,res;
FILE *fp;
fp=fopen("/tmp/ramdisk/input.txt","r");
fscanf(fp,"%d",&a);
fscanf(fp,"%d",&b);
fclose(fp);
fp=fopen("/tmp/ramdisk/output.txt","w");
fprintf(fp,"\n Addition is :%d ",(a+b));
return 0;
}