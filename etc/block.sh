#!/bin/bash

SRC=$1

iptables -I INPUT -s $SRC -j DROP

CMD="iptables -D INPUT -s $SRC -j DROP"
echo $CMD | at now + 10 minutes

