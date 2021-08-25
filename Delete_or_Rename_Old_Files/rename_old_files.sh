#! /bin/bash
# Description : This script will rename old files.
find /home/blky58 -mtime +180 -exec mv {} {}.old \;
