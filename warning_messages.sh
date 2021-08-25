#! /bin/bash

logfile="/var/log/dmesg"
recordfile="./warning_messages"

grep -i warning $logfile > $recordfile
