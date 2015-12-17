import socket,os

s=socket.socket()
host=socket.gethostname()
port=12333
s.bind((host,port))
print "Server running..."

f = open('receive.txt','wb')
s.listen(5)                 # Now wait for client connection.
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
    print "File received receive.txt"
    os.system("ls -l |grep receive")
    c.send('Thank you for connecting')
    c.close()           
