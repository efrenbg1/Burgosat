import subprocess
import time
import re
with open("/boot/cansat/database/rec.txt", "r+") as f:
    data = f.read()
    print data
    data = str(int(data)+1)
    f.seek(0)
    f.write(data)
    f.truncate()
while True:
 try:
	bash = ("sudo raspivid -w 1920 -h 1080 -v -t 300000 -fps 30 -o /home/pi/Videos/" + data + ".h264 -g")
	output = subprocess.check_output(['bash','-c', bash])
        data = str(int(data) + 1)
        with open("/boot/cansat/database/rec.txt", "r+") as f:
         f.seek(0)
         f.write(data)
         f.truncate()
 except:
	pass
