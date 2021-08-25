#! /bin/bash

read -r -p "Absolute path of this script : " apath
read -r -p "Your fullname : " fullname
read -r -p "Description of this script : " description

echo "#!/bin/bash" > $apath
echo "#Author : $fullname" >> $apath
echo "#Date : $(date)" >> $apath
echo "#Modified : $(date)" >> $apath
echo "#Description : $description " >> $apath
chmod a+x $apath
vim $apath
