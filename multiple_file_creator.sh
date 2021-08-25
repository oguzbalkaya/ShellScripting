#! /bin/bash

read -p "How many files do you want to create? " file_count
read -p "Enter the start name of the files. " file_start_name
for i in $(seq 1 $file_count)
do
	touch $file_start_name.$i
done

