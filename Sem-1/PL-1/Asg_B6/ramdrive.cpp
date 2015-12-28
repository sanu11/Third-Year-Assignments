#include<stdio.h>
#include<iostream.h>
#include<stdlib.h>
int main()
{
printf("\n RAMDISK creation for 512M size");
system("rmdir /tmp/ramdisk");
system("mkdir /tmp/ramdisk");
system("chmod 777 /tmp/ramdisk");
system("mount -t tmpfs -o size=512M tmpfs /tmp/ramdisk/");
printf("\n RAMDISK created");
system("df -h|grep ram");
system("cp input.txt /tmp/ramdisk");
system("cp calc /tmp/ramdisk");
return 0;
}