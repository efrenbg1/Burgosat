sleep 20
cd /boot/cansat/
while [ 1 ]
do
	sudo python burgosat.py
	sudo python kill.py
done
