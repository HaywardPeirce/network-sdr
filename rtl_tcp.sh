#!/bin/bash
INTERFACE=eth0
IP=`ip addr show $INTERFACE | grep inet | grep -v inet6 | awk '{print $2}' | cut -d'/' -f1`
if [[ $IP != '' ]] ; then
    /usr/local/bin/rtl_tcp -a $IP
else
    echo "Cannot find IPv4 address on $INTERFACE interface." >&2
    exit 1
fi
