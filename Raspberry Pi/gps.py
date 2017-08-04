import time
import sys
import math
import re
from math import *
import RPi.GPIO as GPIO
time.sleep(5)
import serial
gps = "0 0 0 0 0 0"
ser = serial.Serial('/dev/ttyAMA0',9600)
with open("/boot/cansat/database/gps.txt", "w") as f:
 f.seek(0)
 f.write("0 0 0 0 0 0")
 f.truncate()
 while True:
  try:	
 		data=ser.readline()
		for line in data.split(b'\n') :
                        if line.startswith(b'$GPVTG'):
				_, _, _, _, _, _, speed, _, _ = data.strip().split(',')[1:10]
				if speed != "":
				 speed = round(float(speed)/3.6, 1)
				else:
				 speed = "0.0"
		for line in data.split(b'\n') :
			if line.startswith(b'$GPGGA') :
					hora, lat, lat_direction, lon, lon_direction, _, satellites, _, alt = data.strip().split(',')[1:10]
					if satellites == "":
					   satellites = "00"
					if lat == "":	
					   gps = str(float(hora)+20000) + " " + satellites + gps2 
					   f.seek(0)
                                           f.write(gps)
                                           f.truncate()
					if lat != "":
						lat = round(math.floor(float(lat) / 100) + (float(lat) % 100) / 60, 7)
						if lat_direction == 'S':
							lat = lat * -1                	
						lon = round(math.floor(float(lon) / 100) + (float(lon) % 100) / 60, 7)
						if lon_direction == 'W':
							lon = lon * -1
						gps = str(float(hora)+20000) + " " + satellites + " " + str(lat) + " " + str(lon) + " " + str(alt) + " " + str(speed)
						gps2  = " " + str(lat) + " " + str(lon) + " " + str(alt) + " " + str(speed)
						f.seek(0)
    						f.write(gps)
    						f.truncate()
  except:				
		pass
