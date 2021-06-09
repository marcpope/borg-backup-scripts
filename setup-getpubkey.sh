!/bin/bash

# This script will show the public key of the server, or create one if not exists.

FILE=/root/.ssh/id_rsa.pub

if [ -f $FILE ]; then
	cat /root/.ssh/id_rsa.pub
else
	ssh-keygen -f /root/.ssh/id_rsa -t rsa -N '' > /dev/null 2>&1
	cat /root/.ssh/id_rsa.pub
fi
