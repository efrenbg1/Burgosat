import serial
import check
import subprocess
import sys
import re
import time
import RPi.GPIO as GPIO
import os
import psutil
time.sleep(2)
ser = serial.Serial('/dev/ttyAMA0',9600)
error = check.check()
file = open("/boot/cansat/data_log.csv", "a")
file2 = open("/home/pi/data_log2.csv", "a")
print error
if os.stat("/boot/cansat/data_log.csv").st_size == 0:
	file.write("LAT, LON, V, Z, X, Y, TEMP1, PRES, ALT1, ALT2, CO2, TEMP2, HUM, UV\n")
if os.stat("/home/pi/data_log2.csv").st_size == 0:
        file.write("LAT, LON, V, Z, X, Y, TEMP1, PRES, ALT1, ALT2, CO2, TEMP2, HUM, UV\n")
if error[0] == "1":
	process1 = subprocess.Popen(["python", "mpu.py"])
	id1 = process1.pid
	print "MPU9250 started", id1
	ser.write("MPU9250 started\n")
if error[1] == "1":
        process2 = subprocess.Popen(["python", "bmp280.py"])
	id2 = process2.pid
	print "BMP280 started", id2
	ser.write("BMP280 started\n")
if error[2] == "1":
        process3 = subprocess.Popen(["python", "bme280.py"])
	id3 = process3.pid
	print "BME280 started", id3
	ser.write("BME280 started\n")
if error[3] == "1":
        process4 = subprocess.Popen(["python", "adc.py"])
	id4 = process4.pid
	print "ADC started", id4
	ser.write("ADC started\n")
if error[4] == "1":
        process5 = subprocess.Popen(["python", "humidity.py"])
	id5 = process5.pid
	print "DHT started", id5
	ser.write("DHT started\n")
process6 = subprocess.Popen(["python", "gps.py"])
id6 = process6.pid
print "GPS started", id6
ser.write("GPS started\n")
errorsend = "@173 " + error + "\n"
ser.write(errorsend)
time.sleep(5)
while True:
	try:
		if  error[0] == "1":
			with open("/boot/cansat/database/mpu.txt", "r") as f1:	
				mpu9250 = f1.read()
				mpu = (mpu9250).split()
		else:
			mpu = "0 0 0 0 0 0 0 0 0"
		if error[1] == "1":
			with open("/boot/cansat/database/bmp.txt", "r") as f2:
                        	bmp = f2.read()
		else:
			bmp = "0 0 0 0"
		if error[2] == "1":
			with open("/boot/cansat/database/bme.txt", "r") as f3:
                        	bme = f3.read()
		else:
			bme = "0 0 0 0"
		if error[3] == "1":
			with open("/boot/cansat/database/adc.txt", "r") as f4:
                        	adc = f4.read()
		else:
			adc = "0 0"
		if error[4] == "1":
			with open("/boot/cansat/database/humidity.txt", "r") as f5:
                        	humidity = f5.read()
		else:
			humidity = "0"
		with open("/boot/cansat/database/gps.txt", "r") as f6:
                        	gps = f6.read()
		try:
			send = "@527 " + gps + " " + mpu[0] + " " + mpu[1] + " " + mpu[2] + " " +  humidity + " " + bmp + " " + adc + " "
			if len(send) >= 97:
                		fsend = send + str(len(send)+3) + "\n"
                	if len(send) < 97:
                        	fsend = send + str(len(send)+2) + "\n"
			ser.write(fsend)
			save = gps + " " +  mpu9250 + " " + humidity + " " + bme + " " + bmp + " " + adc + "\n"
			file.write(save)
			file2.write(save)
			print save
		except:
			pass
		time.sleep(0.5)	
	except KeyboardInterrupt:				
		GPIO.cleanup()
		PROCNAME = "python"
		if error[0] == "1":
			process1.kill()
		if error[1] == "1":
                        process2.kill()
		if error[2] == "1":
                        process3.kill()
		if error[3] == "1":
                        process4.kill()
		if error[4] == "1":
                        process5.kill()
                process6.kill()
		for proc in psutil.process_iter():
    # check whether the process name matches
    			if proc.name() == PROCNAME:
        			proc.kill()
		quit()
