#! /bin/bash
FILES="/etc/passwd /etc/group /etc/shadow /etc/asdf"
for file in $FILES
do
	if [ -e $file ]
	then
		echo $file exist
	else
		echo $file does not exist
	fi
done

