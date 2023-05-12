#!/bin/bash

# Desenvolvido por: Bee Solutions
# Autor: Fernando Almondes
# Data: 18/11/2022

ip='IP-OLT-AQUI'
usuario_bd='USUARIO-BD'
senha_bd='SENHA-BD'


PORT=$1

cria_lista () {

for counter in $(seq 1 8);
do

echo > /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$counter.csv

done

# GPON 1
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 1/,/GPON 2/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-1.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 1/,/GPON 2/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-1.csv

# GPON 2
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 2/,/GPON 3/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-2.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 2/,/GPON 3/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-2.csv

# GPON 3
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 3/,/GPON 4/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-3.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 3/,/GPON 4/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-3.csv

# GPON 4
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 4/,/GPON 5/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-4.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 4/,/GPON 5/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-4.csv

# GPON 5
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 5/,/GPON 6/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-5.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 5/,/GPON 6/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-5.csv

# GPON 6
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 6/,/GPON 7/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-6.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 6/,/GPON 7/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-6.csv

# GPON 7
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | sed -n "/GPON 7/,/GPON 8/p" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-7.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | sed -n "/GPON 7/,/GPON 8/p" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-7.csv

# GPON 8
cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Inactive' | sed 's/ dBm//g' | grep -A 200 "GPON 8" | grep -v "GPON" | \
awk '{print $1";"$2";"$3";"$5";"$6";"$7";"$8";"$4}' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-8.csv

cat /var/tmp/zabbix/lista-intelbras-state-$ip-full.txt | grep -e "Active" -e "Inactive" -e "GPON" | grep -v "Configured" | grep -v "Serial" | sed '/^[[:space:]]*$/d' | grep -v 'Active' | sed 's/ dBm//g' | grep -A 200 "GPON 8" | grep -v "GPON" | \
sed 's/ dBm//g' | awk '{print $1";"$2";"$3";"$4";"$4";"$4";"$4";"$8}' | sed 's/-;/0;/g' | sed 's/;-/;NONE/g' >> /var/tmp/zabbix/lista_onus_teste-$ip-gpon-8.csv

}

cria_sql () {

# Defina aqui o ID da sua OLT
olt_id = "2"

echo "" > /opt/bee/insert_table_beeonu_$ip.sql

echo "use bee_db_02;" >> /opt/bee/insert_table_beeonu_$ip.sql

echo "delete from bee_onu where bee_olt_id = $olt_id;" >> /opt/bee/insert_table_beeonu_$ip.sql

echo "Inserindo ONUs no Banco de Dados..."


if [[ ! -z $PORT ]]; then

lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

else

# GPON 1
PORT=1
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 2
PORT=2
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 3
PORT=3
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 4
PORT=4
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 5
PORT=5
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 6
PORT=6
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 7
PORT=7
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

# GPON 8
PORT=8
lista_onus=$(cat /var/tmp/zabbix/lista_onus_teste-$ip-gpon-$PORT.csv)

for i in $lista_onus
do

echo $i | awk -v AWKPORT="$PORT" -v AWKOLTID="$olt_id" -F ';' '{print "INSERT INTO `bee_db_02`.`bee_onu` (`port`,`onuid`,`serial`,`status`,`onurx`,`oltrx`,`distance`,`uptime`,`reason`,`bee_olt_id`) VALUES("AWKPORT","$1",\""$2"\",\""$3"\","$4","$5","$6",\""$7"\",\""$8"\","AWKOLTID");" }' >> /opt/bee/insert_table_beeonu_$ip.sql

done

fi

}

insere_bd () {

	mysql -u $usuario_bd -p"$senha_bd" bee_onu < /opt/bee/insert_table_beeonu_$ip.sql
}


cria_lista
cria_sql
insere_bd