import time
import math
import re
import sys
import RPi.GPIO as GPIO
from MPU9250 import MPU9250
from RollPitchYaw import RollPitchYaw
def start():
	mpu = MPU9250()
	mpu.ready()
	rpy = RollPitchYaw()
mpu = MPU9250()
mpu.ready()
rpy = RollPitchYaw()
while True:
 try:
  with open("/boot/cansat/database/mpu.txt", "w") as f:
   while True:
    accel = mpu.readAccel()
    gyro = mpu.readGyro()
    temp = mpu.readTemp()
    magnet = mpu.readMagnet()
    roll = rpy.calcRoll(accel)
    pitch = rpy.calcPitch(accel)
    yaw = rpy.calcYaw(magnet, roll, pitch)
    all =  str(round(math.degrees(roll),2)) + " " + str(round(math.degrees(pitch),2)) + " " + str(round(math.degrees(yaw),2)) + " " + str(round(magnet[0],2)) + " " + str(round(magnet[1],2)) + " " + str(round(magnet[2],2)) + " " + str(round(accel[0],2)) + " " + str(round(accel[1],2)) + " " + str(round(accel[2],2))
    f.seek(0)
    f.write(all)
    f.truncate()
    time.sleep(0.5)
    print all
  if __name__ == '__main__':
    main()
 except:
	while True:
		try:
			start()
			break
		except:		
			pass
	pass
