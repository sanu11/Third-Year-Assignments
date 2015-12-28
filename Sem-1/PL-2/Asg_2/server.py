import socket
import pcm

s=socket.socket()
host=socket.gethostname()
port=12336
s.bind((host,port))

s.listen(1)
while (True):
	c,addr = s.accept()
	data=pcm.pcm()	
	c.send("Data is " + data)
	c.close()
