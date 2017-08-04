import sys
import time
import Adafruit_DHT
import re
with open("/boot/cansat/database/humidity.txt", "w") as f:
 try:
  while True:
   humidity, temperature = Adafruit_DHT.read_retry(11, 23)
   if humidity is not None and temperature is not None: 
    f.seek(0)
    f.write(str(round(humidity,1)))
    f.truncate()
    time.sleep(2)
 except KeyboardInterrupt:
                GPIO.cleanup()
                quit()
