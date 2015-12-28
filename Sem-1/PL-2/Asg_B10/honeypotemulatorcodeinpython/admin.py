import socket

f=open('attacker.txt','wb')
s1=socket.socket()
honeyhost=socket.gethostname()
s1.bind((honeyhost,20000))

s1.listen(5)
while True:
	c, addr = s1.accept()     # Establish connection with client.
	print 'Got connection from', addr
	print "Receiving..."
	l = c.recv(1024)
	while (l):
		print "Receiving..."
		f.write(l)
		l = c.recv(1024)
	f.close()
	
	print "Done Receiving"
	c.send('Connection completed')
	c.close()     
