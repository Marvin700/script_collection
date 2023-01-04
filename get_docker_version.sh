#!/bin/bash
while read line; do

HOSTNAME="$line"
echo "--------------"					                >> /tmp/composeversion.txt
ping -c 1 $line 
if [ $? = 0 ]
then
HOSTNAME=$(ssh -n root@$line "hostname")
echo $HOSTNAME						                    >> /tmp/composeversion.txt
ssh -n root@$line "docker-compose --version"	>> /tmp/composeversion.txt
ssh -n root@$line "docker compose version"		>> /tmp/composeversion.txt
else 
echo "$HOSTNAME nicht erreichbar"			        >> /tmp/composeversion.txt
fi

done < hosts.txt  
