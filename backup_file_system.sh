#! /bin/bash
tar cvf /tmp/backup.tar /tmp /var 
if [ $? -eq 0 ]
then
	echo tar OK
	gzip /tmp/backup.tar &> /dev/null
	if [ $? -eq 0 ]
	then
		echo gzip OK
		find /tmp/backup.tar.gz -mtime -1 -type f -print &> /dev/null
		if [ $? -eq 0 ]
		then
			echo File OK.
			#scp /tmp/backup.tar.gz root@192.168.1.1:/path
		else
			echo File NOT OK
		fi
	else
		echo gzip NOT OK
	fi
else
	echo tar NOT OK
fi

