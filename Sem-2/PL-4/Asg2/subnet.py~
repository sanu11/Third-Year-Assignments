import os

get_bin = lambda x, n: format(x, 'b').zfill(n)

print "CIDR notation\n"
ip=raw_input("Enter ip\n")
bits=input("Enter bits to be set\n")
r=bits%8
q=bits/8
subnet=""
c=0
flag=0
for i in range(0,q):
	subnet=subnet+"255."
	c=c+1
binary=""
if(r==0):
	flag=1
if(c==4):
	subnet=subnet[:-1]
for i  in range(0,r):
	binary=binary+"1"
if(r!=0):
	for i in range(r-1,7):
		binary=binary+"0"
	subnet=subnet+str(int(binary,2))
	c=c+1	
if(c<4):
	for i in range(c,4):
		if(flag==1):
			subnet=subnet+"0"
			flag=0
		else:
			subnet=subnet+".0"

print "Subnet mask is : ", subnet
no_sub=pow(2,r)
print "Number of subnets are : " ,no_sub

l=ip.split('.')
temp=""
for i in range(0,q):
	temp=temp+l[i]
	temp=temp+"."
print temp
arr=[]
for i in range (0,no_sub):
	temp2=get_bin(i,r)
	for j in range (r,8):
		temp2=temp2+"0"
	temp3=str(int(temp2,2))
	temp3=temp+temp3	
	arr.append(temp3)
	
x=arr[0].split(".")
octets=len(x)
for i in range(0,len(arr)):
	for j in range(octets,4):
		arr[i]=arr[i]+".0"
	print "Subnet ", i+1,
	print " " ,arr[i]

sub=input( "Enter subnet for which ip is to be set\n")	
first=arr[sub-1].split('.')[q]
last=arr[sub].split('.')[q]
print first,last





	


