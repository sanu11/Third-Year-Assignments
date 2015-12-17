import Adafruit_BBIO.ADC as ADC
import time
import sys
import socket
import os
# Create a TCP/IP sockeclass Client():

s = socket.socket()
try:
        s.connect(("192.168.5.77",9111))
        print "connected"
except:
        print "Connection failure!"
        os.abort()

sensor_pin = 'P9_40'

ADC.setup()

while True:
    reading = ADC.read(sensor_pin)
    millivolts = reading * 4500  # 1.8V reference = 1800 mV
    temp_c = (millivolts - 500) / 10
    temp_f = (temp_c * 9/5) + 32
    print('mv=%d C=%d F=%d' % (millivolts, temp_c, temp_f))
    if (temp_c>28):
          print("FIRE IN THE HOLE!!!!")
          message = "Fire in the hall!!"
          print >>sys.stderr, 'sending "%s"' % message
          s.sendall(message)

    time.sleep(1)


