#! /bin/bash
a=`df -h | egrep -v "tmpfs" | tail -n+2 | awk '{print $5}' | cut -d'%' -f1`
for i in $a
do
	if [ $i -ge 90 ]
	then
		echo Check disk space $i : `df -h | grep $i`
	fi
done
