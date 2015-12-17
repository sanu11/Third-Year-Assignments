import numpy as np

def dec_to_bin(x):
	global st
	#print x						#Decimal to binary conversion
	if(x==1):
		st.append('1')		
		return
	else:
	        dec_to_bin(int(x/2))
		st.append(str(int(x%2)))
	
def neg(st):
	i=0						       #2's complement for negative numbers
 	st=st[::-1]	
	while(st[i]!='1'):
		i=i+1
		continue
	i=i+1
	for j in range(i,len(st)):
		if(st[j]=='0'):
			st[j]='1'
		else:
			st[j]='0'
	return st
	

def pcm():	
	amp=input("Enter Amplitude")
	f =input("Enter input frequency : ")
	Fs=input("Enter Sampling frequency : ")
	bits=input("Enter number of bits for encoding")

	y=[]
	sample=Fs/f						#number of samples 
	x=[]
	for i in range (1,sample+1):
		y.append(amp*np.sin(2 *(22/7)* f *i/Fs))	#sampling values in y
		x.append(i)					# 1/samples gives interval between each sample
	print y		
	lev=pow(2,bits)				
	#print lev
	delta=float(2*amp)/float(lev)				#delta is the gap between each quantised level
	print delta		
	i=-amp
	"""
	grp=[]
	for k in range(0,lev):
		grp.append(i)
		i=i+delta
	
	print grp
	"""
	li=[]
	for i in y:					  #quantising values to nearest possible values 
		p=int(i/delta)			
		if(i>0):
			mod=i%delta
		else:
			mod=i%(-delta)
		if(mod>=(delta/2)):
			li.append((p+1)*delta)
		elif(mod<=(-delta/2)):
			li.append((p-1)*delta)
		else:
			li.append(p*delta)        	#quantisied values in li	
	
	print li
	data=''	
	st=[]
	for i in li:
		global st
		st=[]
		a=0	
		if(i<0):
			i=-i
			a=1				#conversion of quanitsied values in li list to binary 
		if(i==0000000):
			st.append(str(i))
		else:
			dec_to_bin(i)
		st=st[::-1]
		while(len(st)!=7):
			st.append('0')
		st=st[::-1]
#		print st
		if(a==1):
			st=neg(st)	
			st=st[::-1]
		st ="".join(st)
		print st
		data=data+st+''				#converting list to string and printing it

	return data



