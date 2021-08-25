#! /bin/bash

iplist="192.168.1.1 192.168.1.2 192.168.1.3"

for ip in $iplist
do
	ping -c1 $ip &> /dev/null
	if [ $? -eq 0 ]
		then
			echo $ip is OK
		else
			echo $ip is NOT OK
	fi
done
