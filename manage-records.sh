#! /bin/bash
# Descripion : This script will manage records in the database file.
databasefile="./database"
if [ -d $databasefile ]
then
	echo $databasefile is not a reqular file
	echo Existing...
	exit 0
fi
select chosen in "List Datas" Add Delete Search Exit
do
	case $chosen in
		"List Datas" )
			if [ -r $databasefile ]
			then
				more $databasefile
			else
				read -p "$databasefile file does not have read permission.Do you want to give r permission? (yes|no) : " answer
				if [ "$answer" == "yes" ]
				then
					chmod +r $databasefile
					more $databasefile
				else
					echo Existing...
					exit 0
				fi
			fi
			;;
		Add )
			./add-record.sh
			;;
		Delete )	
			./delete-record.sh
			;;
		Search )
			if [ -r $databasefile ]
			then
				read -p "Write Hostname, IP or Description : " answer
				grep -q $answer $databasefile
				if [ $? -eq 0 ]
				then
					grep $answer $databasefile
				else
					echo "$answer not found."
				fi
			else
				echo $databasefile does not have read permission.
			fi

			;;
		Exit )
			echo Exiting...
			exit 0
			;;
		* )
			echo Please select 1..3
	esac
done
