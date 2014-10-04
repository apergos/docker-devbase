#!/bin/bash

if [ -z "$1" ]; then
    echo "This script will ssh into a container as root."
    echo
    echo "Usage: $0 container-name"
    echo
    echo "Example: $0 a0bcebd4b6e1"
    exit 1
fi

HOST="${1}"

IPADDR=`docker inspect "--format={{.NetworkSettings.IPAddress}}" "$HOST"`

if [ -z "$IPADDR" ]; then
    echo "Failed to find IP address for $HOST"
    exit 1
else
    echo "$IPADDR"
fi

ssh -l root -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" "$IPADDR"

