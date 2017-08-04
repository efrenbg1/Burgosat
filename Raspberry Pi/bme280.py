import Adafruit_GPIO.I2C as I2C
import time
import sys 
import re 
import RPi.GPIO as GPIO
i2c = I2C
device=i2c.get_i2c_device(0x77)
t2 = 0
altitude2 = 0
QNH=1020
print("QNH:{:.0f}".format(QNH)+" hPA")
altitude = 0
altitude2 = 0
t1 = 0
t2 = 0
start = 0
POWER_MODE=3
OSRS_T = 5
OSRS_P = 5
FILTER = 4
T_SB = 4
CONFIG = (T_SB <<5) + (FILTER <<2)
CTRL_MEAS = (OSRS_T <<5) + (OSRS_P <<2) + POWER_MODE
BMP280_REGISTER_DIG_T1 = 0x88
BMP280_REGISTER_DIG_T2 = 0x8A
BMP280_REGISTER_DIG_T3 = 0x8C
BMP280_REGISTER_DIG_P1 = 0x8E
BMP280_REGISTER_DIG_P2 = 0x90
BMP280_REGISTER_DIG_P3 = 0x92
BMP280_REGISTER_DIG_P4 = 0x94
BMP280_REGISTER_DIG_P5 = 0x96
BMP280_REGISTER_DIG_P6 = 0x98
BMP280_REGISTER_DIG_P7 = 0x9A
BMP280_REGISTER_DIG_P8 = 0x9C
BMP280_REGISTER_DIG_P9 = 0x9E
BMP280_REGISTER_CHIPID = 0xD0
BMP280_REGISTER_VERSION = 0xD1
BMP280_REGISTER_SOFTRESET = 0xE0
BMP280_REGISTER_CONTROL = 0xF4
BMP280_REGISTER_CONFIG  = 0xF5
BMP280_REGISTER_STATUS = 0xF3
BMP280_REGISTER_TEMPDATA_MSB = 0xFA
BMP280_REGISTER_TEMPDATA_LSB = 0xFB
BMP280_REGISTER_TEMPDATA_XLSB = 0xFC
BMP280_REGISTER_PRESSDATA_MSB = 0xF7
BMP280_REGISTER_PRESSDATA_LSB = 0xF8
BMP280_REGISTER_PRESSDATA_XLSB = 0xF9
while True:
 try:
  if (device.readS8(BMP280_REGISTER_CHIPID) == 0x58):
    device.write8(BMP280_REGISTER_SOFTRESET,0xB6)
    time.sleep(0.2)
    device.write8(BMP280_REGISTER_CONTROL,CTRL_MEAS) 
    time.sleep(0.2) 
    device.write8(BMP280_REGISTER_CONFIG,CONFIG)  
    time.sleep(0.2)
    dig_T1 = device.readU16LE(BMP280_REGISTER_DIG_T1)
    dig_T2 = device.readS16LE(BMP280_REGISTER_DIG_T2)
    dig_T3 = device.readS16LE(BMP280_REGISTER_DIG_T3)
    dig_P1 = device.readU16LE(BMP280_REGISTER_DIG_P1)
    dig_P2 = device.readS16LE(BMP280_REGISTER_DIG_P2)
    dig_P3 = device.readS16LE(BMP280_REGISTER_DIG_P3)
    dig_P4 = device.readS16LE(BMP280_REGISTER_DIG_P4)
    dig_P5 = device.readS16LE(BMP280_REGISTER_DIG_P5)
    dig_P6 = device.readS16LE(BMP280_REGISTER_DIG_P6)
    dig_P7 = device.readS16LE(BMP280_REGISTER_DIG_P7)
    dig_P8 = device.readS16LE(BMP280_REGISTER_DIG_P8)
    dig_P9 = device.readS16LE(BMP280_REGISTER_DIG_P9)
    with open("/boot/cansat/database/bme.txt", "w") as f:
     while True: 
	raw_temp_msb=device.readU8(BMP280_REGISTER_TEMPDATA_MSB) 
        raw_temp_lsb=device.readU8(BMP280_REGISTER_TEMPDATA_LSB)
        raw_temp_xlsb=device.readU8(BMP280_REGISTER_TEMPDATA_XLSB)
        raw_press_msb=device.readU8(BMP280_REGISTER_PRESSDATA_MSB) 
        raw_press_lsb=device.readU8(BMP280_REGISTER_PRESSDATA_LSB)
        raw_press_xlsb=device.readU8(BMP280_REGISTER_PRESSDATA_XLSB)
        raw_temp=(raw_temp_msb <<12)+(raw_temp_lsb<<4)+(raw_temp_xlsb>>4)
        raw_press=(raw_press_msb <<12)+(raw_press_lsb <<4)+(raw_press_xlsb >>4)
        var1=(raw_temp/16384.0-dig_T1/1024.0)*dig_T2 
        var2=(raw_temp/131072.0-dig_T1/8192.0)*(raw_temp/131072.0-dig_T1/8192.0)*dig_T3
        temp=(var1+var2)/5120.0 
        t_fine=(var1+var2) 
        var1=t_fine/2.0-64000.0 
        var2=var1*var1*dig_P6/32768.0 
        var2=var2+var1*dig_P5*2 
        var2=var2/4.0+dig_P4*65536.0 
        var1=(dig_P3*var1*var1/524288.0+dig_P2*var1)/524288.0 
        var1=(1.0+var1/32768.0)*dig_P1 
        press=1048576.0-raw_press 
        press=(press-var2/4096.0)*6250.0/var1 
        var1=dig_P9*press*press/2147483648.0 
        var2=press*dig_P8/32768.0 
        press=press+(var1+var2+dig_P7)/16.0 
        altitude2 = altitude
	altitude= 44330.0 * (1.0 - pow(press / (QNH*100), (1.0/5.255))) 
	t2 = t1
	t1 = time.time()
        vspeed = str(round((altitude - altitude2)/(t1-t2),2))
	baro = ("{:.2f}".format(temp)+" {:.2f}".format(press/100)+" {:.2f}".format(altitude)+" " + vspeed)
        f.seek(0)
   	f.write(baro)
   	f.truncate()
	time.sleep(0.5)
      
 except:
                pass
