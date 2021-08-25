#! /bin/bash
IT="mail1@mail.com,mail2@mail.com,mail3@mail.com"
if [ -s /tmp/filtered-messages ]
then
	cat /tmp/filtered-messages | sort | uniq | mail -s "Subject" $IT
	rm /tmp/filtered-messages
fi
