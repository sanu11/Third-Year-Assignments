import socket
import time

f=open('gotit.txt','wb')
s=socket.socket()
s1=socket.socket()
host=socket.gethostname()
honeyhost=socket.gethostname()
s.bind((host,12889))
s1.connect((honeyhost,20000))

s.listen(5)
while True:
	c, addr = s.accept()     # Establish connection with client.
	print 'Got connection from', addr
	print "Receiving..."
	l = c.recv(1024)
	while (l):
		print "Receiving..."
		f.write(l)
		l = c.recv(1024)
	f.close()
	address=str(addr[0])
	port=str(addr[1])
	msg="Attacked by address: "+address+" Port: "+port
	currentTime = time.ctime(time.time()) + "\r\n"
    	s1.send(currentTime.encode('ascii'))
	s1.send(msg)
	s1.shutdown(socket.SHUT_WR)
	s1.close
	print "Done Receiving"
	c.send('Connection completed')
	c.close()     
