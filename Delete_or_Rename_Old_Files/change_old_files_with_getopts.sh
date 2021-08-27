#! /bin/bash
# Description : This script will delete or rename old files.
while getopts "r:" option
do
	case $option in
		r)
			find $HOME -mtime +180 -exec mv {} {}.$OPTARG \;
			echo Done.
			exit 0
			;;
		*)
			echo Invalid option.
			exit 0
			;;

	esac
done

find $HOME -mtime +180 -exec rm {}
echo Done.
