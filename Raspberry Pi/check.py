import RPi.GPIO as GPIO
import smbus
import sys
import os, sys, subprocess
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
bus = smbus.SMBus(1) 
def check():
 import serial
 ser = serial.Serial('/dev/ttyAMA0',9600)
 bme = 0
 bmp = 0
 mpu = 0
 adc = 0
 hum = 0
 dht = 0
 gps = 0
 for device in range(128):
      try:
         bus.read_byte(device)
	
         all = hex(device)
	 if "0x48" in all and adc == 0: 
		ser.write("ADC OK\n")
		print "ADC OK"
		adc = 1
	 if "0x76" in all and bmp == 0:
                ser.write("BMP280 OK\n")
		print "BMP280 OK"
		bmp = 1
	 if "0x77" in all and bme == 0:
                ser.write("BME280 OK\n")
		print "BME280 OK"
		bme = 1
	 if "0x68" in all and mpu == 0:
                ser.write("MPU9250 OK\n")
		print "MPU9250 OK"
		mpu = 1
      except: 
         pass
 if adc == 0:
	ser.write("ADC failed!\n")
	print "ADC failed!"
 if bmp == 0:
        ser.write("BMP280 failed!\n")
	print "BMP280 failed!"
 if bme == 0:
        ser.write("BME280 failed!\n")
	print "BME280 failed!"
 if mpu == 0:
        ser.write("MPU9250 failed!\n")
	print "MPU9250 failed!"
 while (hum < 2):
		dht = GPIO.input(23)	
		hum = hum + 1
 if dht == 1:
	ser.write("DHT22 OK\n")
	print "DHT22 OK"
 if dht == 0:
	ser.write("DHT22 failed!\n")
	print "DHT22 failed!"
 return str(mpu)+str(bmp)+str(bme)+str(adc)+str(dht)
 ser.close()
 GPIO.cleanup()
 quit()

