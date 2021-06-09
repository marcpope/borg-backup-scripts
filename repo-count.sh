#!/bin/bash

# Counts the number of backup points in a repo

while getopts u:r:p: option
do
 case "${option}"
 in
 u) USER=${OPTARG};;
 r) REPO=${OPTARG};;
 p) PASSWORD=${OPTARG};;
 esac
done

export BORG_PASSPHRASE=$PASSWORD
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=YES
/usr/bin/borg list /home/$USER/$REPO | wc -l
