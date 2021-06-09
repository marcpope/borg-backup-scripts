#!/bin/bash
# This script will copy the server's public key file to a client so the server can run commands for backup
# requires sshpass to be installed


# get variables
./config.sh

while getopts c:p:z:u: option
do
 case "${option}"
 in
 c) CLIENT=${OPTARG};;
 p) PORT=${OPTARG};;
 z) PASS=${OPTARG};;
 u) USER=${OPTARG};;
 esac
done

## sshpass command will login to a server with a password and copy BBServer's SSH Key to the Client
/usr/bin/sshpass -p $PASS ssh-copy-id -o ConnectTimeout=10 -p $PORT root@$CLIENT
