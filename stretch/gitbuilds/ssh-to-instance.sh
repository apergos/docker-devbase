#!/bin/bash

if [ -n "$1" ]; then
    host="$1"
else
    echo "Usage: $0 container-name"
    possibles=$( docker ps | grep stretch-pbuild-prod | cut -d ' ' -f 1 )
    echo "Advice: use one of ${possibles} for the container"
    exit 1
fi

IPADDR=`docker inspect "--format={{.NetworkSettings.IPAddress}}" "$host"`

if [ -z "$IPADDR" ]; then
    echo "Failed to find IP address for $host"
    exit 1
else
    echo "$IPADDR"
fi

ssh -t -l root "$IPADDR"
