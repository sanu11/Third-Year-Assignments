import Adafruit_BBIO.GPIO as lift
import time

lift.setup("P8_12",lift.OUT)
lift.setup("P8_13",lift.OUT)
lift.setup("P8_14",lift.OUT)
lift.output("P8_12",lift.LOW)
lift.output("P8_13",lift.LOW)
lift.output("P8_14",lift.LOW)
lift.setup("P8_15",lift.IN)
lift.setup("P8_16",lift.IN)
lift.setup("P8_17",lift.IN)

floor=1

def f1():
                global floor
                lift.output("P8_12",lift.HIGH)
                lift.output("P8_13",lift.LOW)
                lift.output("P8_14",lift.LOW)
                floor=1
                time.sleep(1)
def f2():
                global floor
                lift.output("P8_12",lift.LOW)
                lift.output("P8_13",lift.HIGH)
                lift.output("P8_14",lift.LOW)
                floor=2
                time.sleep(1)
def f3():
                global floor
                lift.output("P8_12",lift.LOW)
                lift.output("P8_13",lift.LOW)
                lift.output("P8_14",lift.HIGH)
                floor=3
                time.sleep(1)


while True:
        if(lift.input("P8_15")==1):
                print floor
                if(floor==3):
                        f2()
                        f1()
                elif(floor==2 or floor==1):
                        f1()


        if(lift.input("P8_16")==1):
                print floor
                f2()


        if(lift.input("P8_17")==1):
                print floor
                if(floor==1):
                        f2()
                        f3()
                elif(floor==2 or floor ==3):
                        f3()
