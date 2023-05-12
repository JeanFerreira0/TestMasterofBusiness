#!/bin/bash

# Desenvolvido por Bee Solutions
# Autor: Fernando Almondes
# Data: 03/02/2023

COMMUNITY=$1
IP=$2
PON=$3

aut=$(snmpwalk -v2c -c $COMMUNITY $IP 1.3.6.1.4.1.37950.1.1.5.12.1.27.1.2.$PON | grep -oP 'INTEGER:\s\K\d+')
onl=$(snmpwalk -v2c -c $COMMUNITY $IP 1.3.6.1.4.1.37950.1.1.5.12.1.27.1.3.$PON | grep -oP 'INTEGER:\s\K\d+')

off=$(($aut-$onl))

echo "$off"