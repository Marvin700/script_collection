#!/bin/bash
while read line; do

HOSTNAME="$line"
ping -c1 $line > /dev/null
if [ $? -eq 0 ]
  then 
    HOSTNAME=$(nslookup $line | grep -w name | awk -F "name = " '{print $2}')
    os=$(nmap -T4 -A -v $line | grep -w Running | awk -F "Running: " '{print $2}')
    echo "$line, $HOSTNAME, $os" >> /tmp/log.txt
fi

done < hosts.txt
