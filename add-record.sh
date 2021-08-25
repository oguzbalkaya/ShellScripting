#! /bin/bash
# Descriptin : This script will add a record to database file

databasefile="./database"

if [ -f $databasefile ]
then
	if [ -w $databasefile ]
	then
		read -p "Enter hostname : " hostname
		echo
		grep -q $hostname $databasefile
		if [ $? -eq 0 ]
		then
			echo Hostname $hostname already exist.
			exit 0
		fi
		read -p "Enter IP Address " IP
		echo
		grep -q $IP $databasefile
		if [ $? -eq 0 ]
		then
			echo IP $IP already exist
			exit 0
		fi
		read -p "Enter description : " description
		echo
		echo $hostname $IP $description >> database
	else
		read -p "$databasefile file does not have write permission. Dou you want to give w  permission? (yes|no) " answer
		if [ "$answer" == "yes" ]
		then
			chmod +w $databasefile
			./$0
		else
			echo Exiting...
			exit 0
		fi
	fi
else
	echo $databasefile is not a regular file.
fi

