# Author: Tony DiCola
# Modified: Efrén Boyarizo
import time
import re
import sys
import Adafruit_ADS1x15
import RPi.GPIO as GPIO
adc = Adafruit_ADS1x15.ADS1115()
def start():
 adc = Adafruit_ADS1x15.ADS1115()
GAIN = 2/3
while True:
 try:
  with open("/boot/cansat/database/adc.txt", "w") as f:
   while True:
    values = [0]*4
    for i in range(4):
        values[i] = adc.read_adc(i, gain=2/3)
    dataall = str(round(0.004882814*1000*(values[0]*0.1875),2)) + " " + str(round(values[1]*0.1875/100,2)) + " " + str(round(values[2]*0.1875/100,2)) + " " + str(round(values[3]*0.1875/1000,2)) 
    f.seek(0)
    f.write(dataall)
    f.truncate()
    print dataall
    time.sleep(0.5)
 except:
       while True:
	try:         
		start()
		break
		pass
	except:
		pass

