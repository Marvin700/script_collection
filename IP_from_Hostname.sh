#!/bin/bash
while read line; do
ping -c1 $line > /dev/null
if [ $? -eq 0 ]
  then    
    IP=$(ping -c1 $line  |  grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"|uniq)
    echo "$IP"    >> /tmp/IP.txt
  else
    echo "no IP"  >> /tmp/IP.txt
fi

done < hosts.txt
