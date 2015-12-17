import socket

s=socket.socket()
host=socket.gethostname()
port=12336

s.connect((host,port))


print s.recv(512)
s.close

