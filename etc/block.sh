#!/bin/bash

SRC=$1

if ! iptables -L INPUT | grep "$SRC" > /dev/null
then
    iptables -I INPUT -s $SRC -j DROP

    CMD="iptables -D INPUT -s $SRC -j DROP"
    echo $CMD | at now + 10 minutes
fi
