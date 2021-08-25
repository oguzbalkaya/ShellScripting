#! /bin/bash
# Description : This script will delete old files.
find /home/blky58 -mtime +180 -exec rm {} \;

