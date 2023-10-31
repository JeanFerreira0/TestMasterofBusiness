#!/bin/bash

# Desenvolvido por: Bee Solutions
# Autor: Fernando Almondes
# Data: 16/08/2023

COMMUNITY=$1
IP=$2
PORTA_SNMP=$3

snmpwalk -v2c -c $COMMUNITY $IP 1.3.6.1.4.1.2011.6.128.1.1.2.48.1.2 | grep -v "No Such" |  wc -l