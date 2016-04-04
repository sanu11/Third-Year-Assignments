import Adafruit_BBIO.GPIO as lift
import time

lift.setup("P9_27",lift.OUT)
lift.setup("P9_23",lift.OUT)
lift.setup("P9_13",lift.OUT)
lift.output("P9_27",lift.LOW)
lift.output("P9_23",lift.LOW)
lift.output("P9_13",lift.LOW)
lift.setup("P8_14",lift.IN)
lift.setup("P9_14",lift.IN)
lift.setup("P9_30",lift.IN)

floor=1

def f1():
                global floor
                lift.output("P9_27",lift.HIGH)
                lift.output("P9_23",lift.LOW)
                lift.output("P9_13",lift.LOW)
                floor=1
                time.sleep(1)
def f3():
                global floor
                lift.output("P9_27",lift.LOW)
                lift.output("P9_23",lift.HIGH)
                lift.output("P9_13",lift.LOW)
                floor=3
                time.sleep(1)
def f2():
                global floor
                lift.output("P9_27",lift.LOW)
                lift.output("P9_23",lift.LOW)
                lift.output("P9_13",lift.HIGH)
                floor=2
                time.sleep(1)


while True:
        if(lift.input("P8_14")==1):
                print floor
                if(floor==3):
                        f2()
                        f1()
                elif(floor==2 or floor==1):
                        f1()


        if(lift.input("P9_14")==1):
                print floor
                f2()

        if(lift.input("P9_30")==1):
                print floor
                if(floor==1):
                        f2()
                        f3()
                elif(floor==2):
                        f3()
