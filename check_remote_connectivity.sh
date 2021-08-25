#! /bin/bash
menu="n :  Add IP address\n
d : Delete IP address\n
c : Check connectivity\n
q : Quit"

file="ip_list"

while true
do
	echo -e $menu
	read -p 'Action you want to do : ' action

	if [ $action == 'n' ]
	then
		read -p 'IP Address : ' ipaddr
		line=$(awk "/$ipaddr/ {print NR;exit}" $file)
		if [[ $line == "" ]]
		then
			echo $ipaddr >> $file
			echo "$ipaddr has been added."
		else
			echo "$ipaddr already exist."
		fi
	elif [ $action == 'd' ]
	then
		read -p 'IP Address : ' ipaddr
		line=$(awk "/$ipaddr/ {print NR;exit}" $file)
		if [[ $line == "" ]]
		then
			echo "No record."
		else
			sed -i "$line d" $file
			echo "$ipaddr has been deleted."
		fi
	elif [ $action == 'c' ]
	then
		for ip in $(cat $file)
		do
			ping -c1 $ip &> /dev/null
			if [ $? -eq 0 ]
			then
				echo $ip ping passed
			else
				echo $ip ping failed
			fi
		done
	elif [ $action == 'q' ]
	then
		break
	else
		echo "Unknown action."
	fi
done
