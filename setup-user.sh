#!/bin/bash

# This script creates a user on a borg server where the client can backup to.
# Assumes user accounts in /home/ directory (where your storage is). You can alter to your environment.
# Creates a user and an ssh directory with authorized keys to be setup in a later command 
#
# Usage:  setup-user.sh -u someuser

while getopts u: option
do
 case "${option}"
 in
 u) USER=${OPTARG};;
 esac
done

adduser $USER
mkdir /home/$USER/.ssh/
touch /home/$USER/.ssh/authorized_keys
chown $USER:$USER /home/$USER/.ssh/authorized_keys
chmod 600 /home/$USER/.ssh/authorized_keys
echo "1"
