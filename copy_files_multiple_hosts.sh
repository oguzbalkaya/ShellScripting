#! /bin/bash
IPLIST=`cat ./ip_list`
for ip in $IPLIST
do
	#scp dosyapath $i:/path
	if [ $? -eq 0 ]
	then
		echo $ip OK
	else
		echo $ip NOT OK
	fi
done
