#!/bin/bash
while read line; do

HOSTNAME="$line"
echo "--------------"	            >> /tmp/test.txt
ping -c1 $line > /dev/null
if [ $? -eq 0 ]
  then 
    HOSTNAME=$(ssh -n root@$line "hostname")    
    echo "$HOSTNAME"       		          	>> /tmp/test.txt
    ssh -n root@$line "cat /etc/*release"	>> /tmp/test.txt
  else
   echo "$HOSTNAME nicht erreichbar !"		>> /tmp/test.txt
fi

done <hosts.txt
