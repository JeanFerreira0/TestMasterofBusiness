#!/bin/bash

COMMUNITY=$1
IP=$2
PON=$3
STATUS=$4

#Total de ONUs por Status
#1 = LOS (3)
#3 = Online (438)
#4 = DyingGasp (35)
#6 = OffLine (33)

#Ex: ./ponzte public seu-ip 268501248 3

snmpwalk -v2c -c $COMMUNITY $IP .1.3.6.1.4.1.3902.1082.500.10.2.3.8.1.4."$PON" | awk '{print $4}' | grep "$STATUS" | wc -l
