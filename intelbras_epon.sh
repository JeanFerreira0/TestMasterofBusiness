#!/bin/bash

# Desenvolvido por: Bee Solutions
# Autor: Fernando Almondes
# Data: 16-04-2023 19:45

# Preencha aqui as suas variaveis
usuario='USUARIO-OLT'
senha='SENHA-OLT'
ip='IP-OLT'

usuario_bd='USUARIO-BD'
senha_bd='SENHA-BD'


coleta_geral () {

CMDX='show pon'

(echo "$ip - " ;
echo unset echo
echo open "$ip"
sleep 1
echo "$usuario"
sleep 1
echo "$senha"
sleep 5
echo "en"
sleep 1
echo "configure terminal"
sleep 1
echo "$CMDX"
sleep 5
echo "exit"
) | telnet > /var/tmp/zabbix/lista-intelbras-pon-$ip-full.txt

}

coleta_rx () {

CMDX='show onu-optical-info'

(echo "$ip - " ;
echo unset echo
echo open "$ip"
sleep 1
echo "$usuario"
sleep 1
echo "$senha"
sleep 5
echo "en"
sleep 1
echo "configure terminal"
sleep 1
echo "$CMDX"
sleep 60
echo "exit"
) | telnet > /var/tmp/zabbix/lista-intelbras-rx-$ip-full.txt


}

coleta_state () {

CMDX='show onu-status'

(echo "$ip - " ;
echo unset echo
echo open "$ip"
sleep 1
echo "$usuario"
sleep 1
echo "$senha"
sleep 5
echo "en"
sleep 1
echo "configure terminal"
sleep 1
echo "$CMDX"
sleep 5
echo "exit"
) | telnet > /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt


}

monta_arquivos () {

cat /var/tmp/zabbix/lista-intelbras-pon-$ip-full.txt | grep enable | sed 's/[^[:print:]]//' | awk '{print $1";"$2";"$4}' > /var/tmp/zabbix/lista1.txt

cat /var/tmp/zabbix/lista-intelbras-rx-$ip-full.txt | grep -E '0.+/' | sed 's/[^[:print:]]//' | awk '{print $2";"$3}' > /var/tmp/zabbix/lista2.txt

cat /var/tmp/zabbix/lista-intelbras-rx-$ip-full.txt | grep -E '0.+/' | awk '{print $5";"$6}' | sed 's/[^[:print:]]//' | awk -F ';' '{print $1}' | cut -d'/' -f2,4 > /var/tmp/zabbix/lista3.txt

cat /var/tmp/zabbix/lista-intelbras-rx-$ip-full.txt | grep -E '0.+/' | awk '{print $5";"$6}' | sed 's/[^[:print:]]//' | awk -F ';' '{print $2}' | cut -d'/' -f2,4 > /var/tmp/zabbix/lista4.txt

# Lista on
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep '0/' | sed -E 's/([0-9]{2}\/[0-9]{2}\/[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\1-\2/g' | \
awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | sed 's/[^[:print:]]//' | awk -F ';' '$7 == "Up"' > /var/tmp/zabbix/lista5.txt

# Lista off
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep '0/' | sed -E 's/([0-9]{2}\/[0-9]{2}\/[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\1-\2/g' | \
awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | sed 's/[^[:print:]]//' | awk -F ';' '$7 == "Down"' | sed 's/$/;-;-;-;-;-;-;-/' > /var/tmp/zabbix/lista6.txt


# Para Onus onlines
# Lista portas
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep '0/' | sed -E 's/([0-9]{2}\/[0-9]{2}\/[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\1-\2/g' | \
awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | sed 's/[^[:print:]]//' | awk -F ';' '$7 == "Up"' | awk -F ';' '{print $1}' | awk -F '/' '{print $2}' > /var/tmp/zabbix/lista7.txt

# Lista onuids
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep '0/' | sed -E 's/([0-9]{2}\/[0-9]{2}\/[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\1-\2/g' | \
awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | sed 's/[^[:print:]]//' | awk -F ';' '$7 == "Up"' |  awk -F ';' '{print $1}' | awk -F '/' '{print $3}' > /var/tmp/zabbix/lista8.txt

# Para Onus offlines
# Lista portas
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep '0/' | sed -E 's/([0-9]{2}\/[0-9]{2}\/[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\1-\2/g' | \
awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | sed 's/[^[:print:]]//' | awk -F ';' '$7 == "Down"' | awk -F ';' '{print $1}' | awk -F '/' '{print $2}' > /var/tmp/zabbix/lista9.txt

# Lista onuids
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep '0/' | sed -E 's/([0-9]{2}\/[0-9]{2}\/[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2})/\1-\2/g' | \
awk '{print $1";"$2";"$3";"$4";"$5";"$6";"$7}' | sed 's/[^[:print:]]//' | awk -F ';' '$7 == "Down"' |  awk -F ';' '{print $1}' | awk -F '/' '{print $3}' > /var/tmp/zabbix/lista10.txt


paste -d ';' /var/tmp/zabbix/lista7.txt /var/tmp/zabbix/lista8.txt /var/tmp/zabbix/lista5.txt /var/tmp/zabbix/lista1.txt /var/tmp/zabbix/lista2.txt /var/tmp/zabbix/lista3.txt \
/var/tmp/zabbix/lista4.txt > /var/tmp/zabbix/lista_finalizando.txt

paste -d ';' /var/tmp/zabbix/lista9.txt /var/tmp/zabbix/lista10.txt /var/tmp/zabbix/lista6.txt > /var/tmp/zabbix/lista_final_off.txt

cat /var/tmp/zabbix/lista_final_off.txt >> /var/tmp/zabbix/lista_finalizando.txt

cat /var/tmp/zabbix/lista_finalizando.txt | awk -F ';' '{print $1,$2,$3,$4,$5,$6,$7,$9,$15,$16}' | \
awk '{ if(($9 == "-") && ($10 == "-")) {$9 = "-40"; $10 = "-40"} {print $1";"$2";"$3";"$4";"$5";"$6";"$7";"$8";"$9";"$10}}' > /var/tmp/zabbix/lista_final.txt

#cat /var/tmp/zabbix/lista_final.txt

}

gera_sql () {

olt_id = "1"

lista_onus=$(cat /var/tmp/zabbix/lista_final.txt)

echo "" > /var/tmp/zabbix/insert_table_beeonu_$ip.sql

echo "use bee_db_02;" >> /var/tmp/zabbix/insert_table_beeonu_$ip.sql

echo "delete from bee_onu where bee_olt_id = $olt_id;" >> /var/tmp/zabbix/insert_table_beeonu_$ip.sql

echo "Inserindo ONUs no Banco de Dados..."

datetime=$(date +'%Y-%m-%d %H:%M:%S')
echo "Horario da execucao: $datetime"

for i in $lista_onus
do

echo $i | awk -v DATE="$datetime" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO bee_db_02.bee_onu (onuid,port,serial,model,onurx,onutx,status,distance,uptime,datetime,bee_olt_id) \
VALUES("$2",\""0"/"$1"\",\""$4"\",\""$7"\","$10","$9",\""$8"\",\""$5"\",\""$6"\",\""DATE"\","AWKOLTID");" }' >> /var/tmp/zabbix/insert_table_beeonu_$ip.sql

done

#cat /var/tmp/zabbix/insert_table_beeonu_$ip.sql

}

insere_bd () {

        mysql -u $usuario_bd -p"$senha_bd" bee_db_02 < /var/tmp/zabbix/insert_table_beeonu_$ip.sql
}

coleta_geral
coleta_rx
coleta_state
monta_arquivos
gera_sql
insere_bd