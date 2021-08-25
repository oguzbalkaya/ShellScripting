#! /bin/bash
today=`date | awk '{print $1,$3,$2}'`
echo Today : $today
last | grep "$today"
