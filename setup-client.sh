#!/bin/bash

# get variables
./config.sh

while getopts c:p:u: option
do
 case "${option}"
 in
 c) CLIENT=${OPTARG};;
 p) PORT=${OPTARG};;
 u) USER=${OPTARG};;
 esac
done

echo "Get/Create Public Key from client machine and put in $USER authorized keys.."
/usr/bin/ssh root@$CLIENT -p $PORT /bin/bash < /var/www/bbs/setup-getpubkey.sh >> /home/$USER/.ssh/authorized_keys

echo "Add borg's server in client's known_hosts file.."
/usr/bin/ssh root@$CLIENT -p $PORT "ssh $USER@$BBSERVER -o StrictHostKeyChecking=no 'echo 1 > /dev/null'"

echo "Copy borg to 64Bit CentOS client (in future, copy correct client by machine type)"
/usr/bin/scp -P $PORT borg-linux64 root@$CLIENT:/usr/local/bin/borg
