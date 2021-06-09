#!/bin/bash
#
# Borg Backup Server (BBS)
#
# This script tells a remote client machine to start a backup
# Once complete, it sends the result to BBS for logging data
#
# This will be re-written later
#

# get variables
./config.sh

while getopts r:c:p:u:j:d: option
do
 case "${option}"
 in
 r) REPO=${OPTARG};;
 c) CLIENT=${OPTARG};;
 p) PORT=${OPTARG};;
 u) USER=${OPTARG};;
 j) JOBID=${OPTARG};;
 d) DIRS=${OPTARG};;
 esac
done

ssh -f root@$CLIENT -p $PORT "( \
	borg create --json $USER@$BBSERVER:$REPO::$JOBID $DIRS >> /var/log/$JOBID.log ; \
	curl -H 'Content-Type: application/json' -d '@/var/log/$JOBID.log' https://$BBSERVER/api/update ; \
	)& " > /dev/null 2>&1
