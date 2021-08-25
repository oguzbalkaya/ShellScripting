#! /bin/bash

read -p "Username : " username

usercount=`grep -c $username /etc/passwd`
if [ $usercount != 0 ]
then
	echo User $username already exist.Please try different username.
	exit 0
fi

read -p "User description : " description

read -p "Do you want to specify user ID number? (y/n)" ans

if [ $ans == y ]
then
	read -p "Userid : " userid
	useridcount=`grep -c $userid /etc/passwd`
	if [ $useridcount != 0 ]
	then 
		echo User id $userid already exist.
		exit 0
	else
		useradd $username -c "$description" -u $userid
		if [ $? -eq 0 ]
		then
			echo $username has been created.
		else
			echo ERROR
		fi	
	fi
elif [ $ans == n ]
	then
		useradd $username -c "$description"
		if [ $? -eq 0 ]
		then
			echo $username has been created.
		else
			echo ERROR
		fi
fi
