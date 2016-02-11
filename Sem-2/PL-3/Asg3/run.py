import Adafruit_BBIO.GPIO as GPIO
import time

GPIO.setup("P8_10", GPIO.OUT)
GPIO.setup("P8_11", GPIO.OUT)
GPIO.setup("P8_12", GPIO.OUT)
GPIO.setup("P8_13", GPIO.OUT)
GPIO.setup("P8_14", GPIO.OUT)
GPIO.setup("P8_15", GPIO.OUT)

while True:
        GPIO.output("P8_10", GPIO.HIGH)
        GPIO.output("P8_15", GPIO.HIGH)
        time.sleep(5)
        GPIO.output("P8_10", GPIO.LOW)
        GPIO.output("P8_15", GPIO.LOW)

        GPIO.output("P8_11", GPIO.HIGH)
        GPIO.output("P8_14", GPIO.HIGH)

        time.sleep(5)
        GPIO.output("P8_11", GPIO.LOW)
        GPIO.output("P8_14", GPIO.LOW)

        GPIO.output("P8_12", GPIO.HIGH)
        GPIO.output("P8_13", GPIO.HIGH)

        time.sleep(5)
        GPIO.output("P8_12", GPIO.LOW)
        GPIO.output("P8_13", GPIO.LOW)
        GPIO.output("P8_11", GPIO.HIGH)
        GPIO.output("P8_14", GPIO.HIGH)

        time.sleep(5)
        GPIO.output("P8_11", GPIO.LOW)
        GPIO.output("P8_14", GPIO.LOW)

