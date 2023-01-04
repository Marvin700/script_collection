#!/bin/bash
clear
while read line; do

HOSTNAME=$line   
echo "----------------"
ping -c1 $line > /dev/null
if [ $? -eq 0 ]
  then 
    HOSTNAME=$(ssh -n root@$line "hostname")
    echo "$HOSTNAME"
    scp /tmp/cert/* root@$line:/etc/pki/ca-trust/source/anchors/
    ssh -n root@$line "update-ca-trust extract"
    echo "$line done"
  else
    echo "$HOSTNAME host no answer"
fi

done <hosts.txt
