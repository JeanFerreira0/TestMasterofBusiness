#!/bin/bash

# Desenvolvido por: Bee Solutions
# Autor: Fernando Almondes
# Data: 16/08/2023

COMMUNITY=$1
IP=$2
PON=$3
STATUS=$4
PORTA_SNMP=$5

#Total de ONUs Online
snmpwalk -v2c -c $COMMUNITY $IP:"$PORTA_SNMP" .1.3.6.1.4.1.2011.6.128.1.1.2.46.1.15."$PON" | grep -v 'No Such' | awk '{print $4}' | grep "$STATUS" | wc -l