#!/bin/bash

host="jessie-pbuild-prod"

IPADDR=`docker inspect "--format={{.NetworkSettings.IPAddress}}" "$host"`

if [ -z "$IPADDR" ]; then
    echo "Failed to find IP address for $host"
    exit 1
else
    echo "ssh to $IPADDR"
fi

ssh -t -l root "$IPADDR"
