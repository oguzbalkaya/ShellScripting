#! /bin/bash

read -p "Enter day (e.g. Mon) : " d
read -p "Enter month (e.g. Jul) : " m
read -p "Enter date (e.g. 16) : " da
echo Date : $d $m $da
last | grep "$d $m $da"
