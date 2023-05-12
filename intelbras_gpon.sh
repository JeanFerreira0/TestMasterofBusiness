#!/bin/bash

# Desenvolvido por: Bee Solutions
# Autor: Fernando Almondes
# Data: 18/11/2022 23:53

# Preencha as variaveis aqui
usuario='USUARIO-OLT-AQUI'
senha='SENHA-OLT-AQUI'
ip='IP-OLT-AQUI'

CMDX='onu status'

(echo "$ip - " ;
echo unset echo
echo open "$ip"
sleep 1
echo "$usuario"
sleep 1
echo "$senha"
sleep 10
echo "$CMDX"
sleep 30
echo "exit"
) | telnet > /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt
