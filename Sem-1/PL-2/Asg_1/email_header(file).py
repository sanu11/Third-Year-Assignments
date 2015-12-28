fp=open("mail","r")
#data={}
l1=[]
l2=[]
l3=[]
l4=[]

for line in fp:
	for word in line.split():
		if word=="To:":
			l1.append(line[3:])
			#print l1	
		if word=="From:":
			l2.append(line[5:])
			#print l2
		if word=="Subject:":
			l3.append(line[8:])
			#print l3
		if word=="Date:":
			l4.append(line[5:])
			#print l4

count=0
index=-1
print "\nReceiver's List\n"
print l1
print "\nSender's List\n"
print l2

sender=raw_input("\nEnter mail sender's name ")
recipient=raw_input("\nEnter mail receiver's name ")

a=0
for line in l2:
	index=index+1
	for word in line.split():		
		if sender.lower() in word.lower():
		        res1=line
			for word in l1[index].split():
			  if recipient.lower() in word.lower():
    				res2=l1[index]
				print "To :",res2
 				print "From :",res1
 				print "Subject :" ,l3[index]
 				print "Date :",l4[index]
				a=1
				break
			if(a==1):
				break
					 
if(a==0):
  print "Not found"

  
  
			 

