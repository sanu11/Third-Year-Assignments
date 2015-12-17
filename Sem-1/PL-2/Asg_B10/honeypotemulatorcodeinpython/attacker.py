import socket        
     

s = socket.socket()         
host = socket.gethostname()                 

s.connect((host, 12889))
f = open('tosend.txt','rb')
print 'Sending...'
line = f.read(1024)
while (line):
    print 'Sending...'
    s.send(line)
    line = f.read(1024)
f.close()
print "Done Sending"
s.shutdown(socket.SHUT_WR)
print s.recv(1024)
s.close 
