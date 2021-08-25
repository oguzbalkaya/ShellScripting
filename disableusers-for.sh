#! /bin/bash
#Description : This script will disable inactive user accounts with for loops
list=`lastlog -b 90 | tail -n +2 | grep 'test' | awk '{print $1}'`
for user in $list
do
	usermod -L $user
done
