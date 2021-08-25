#! /bin/bash
# Description : This script will delete a record from database
databasefile="./database"
if [ -f $databasefile ]
then
	if [ -w $databasefile ]
	then
		read -p "Enter hostname or IP address: " host
		echo
		grep -q $host $databasefile
		if [ $? -eq 0 ]
		then
			sed -i '/'$host'/d' $databasefile
			echo $host has been deleted.
		else
			echo Record does not exist
		fi
	else
		read -p "$databasefile file does not have write permission.Do you want to give w permission? (yes|no)" answer
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
	echo $databasefile is not a reqular file.
fi

