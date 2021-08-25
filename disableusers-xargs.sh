#! /bin/bash
#Description : This script will diable inactive user accounts with xargs

lastlog -b 90 | tail -n +2 | grep 'test' | awk '{print $1}' | xargs -I {} usermod -L {}
