import Adafruit_BBIO.GPIO as g
import time

g.setup("P8_15",g.IN)

g.setup("P8_16",g.IN)

g.setup("P8_17",g.IN)

g.setup("P8_12", g.OUT)

g.setup("P8_13", g.OUT)

g.setup("P8_14", g.OUT)

previous_state=1

g.output("P8_12", g.HIGH)

time.sleep(0.2)

g.output("P8_12", g.LOW)


while True:

	current_state=0

	if(g.input("P8_15")==1):

		current_state=1

	elif(g.input("P8_16")==1):

		current_state=2

	elif(g.input("P8_17")==1):

		current_state=3



	if current_state !=0 :



            	print("You were at Floor "+str(previous_state)+" and you want to go to "+str(current_state))

		while previous_state<=current_state:

			pinoutput="P8_"+str(11+previous_state)

			g.output(pinoutput, g.HIGH)

			print("You are on Floor "+str(previous_state))

			if(previous_state!=current_state):

				previous_state=previous_state+1

				time.sleep(1)

        	                g.output(pinoutput, g.LOW)

			else:

				break          

            

 		while previous_state>=current_state:

           		pinoutput="P8_"+str(11+previous_state)

            		g.output(pinoutput, g.HIGH)

                	print("You are on floor"+str(previous_state))

                	if(previous_state!=current_state):

		                previous_state=previous_state-1

		                time.sleep(1)

		                g.output(pinoutput, g.LOW)



                	else:

                        	break

