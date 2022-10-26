#!/bin/bash
#########################
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
sttt=`cat /root/log-install.txt`

if [ ! -f "/etc/afak.conf" ]; then
ISP=`curl -sS ip-api.com | grep -w "isp" | awk '{print $3,$4,$5,$6,$7,$8,$9}' | cut -d'"' -f2 | cut -d',' -f1 | tee -a /etc/afak.conf`
CITY=`curl -sS ip-api.com | grep -w "city" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf`
WKT=`curl -sS ip-api.com | grep -w "timezone" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf`
IPVPS=`curl -sS ip-api.com | grep -w "query" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf`
else
ISP=$(cat /etc/afak.conf | awk 'NR==1 {print $1,$2,$3,$4,$5,$6,$7,$8}')
CITY=$(cat /etc/afak.conf | awk 'NR==2 {print $1,$2,$3,$4,$5,$6,$7,$8}')
WKT=$(cat /etc/afak.conf | awk 'NR==3 {print $1,$2,$3,$4,$5,$6,$7,$8}')
IPVPS=$(cat /etc/afak.conf | awk 'NR==4 {print $1,$2,$3,$4,$5,$6,$7,$8}')
fi

cek=/home/shws
if [[ -f "$cek" ]]; then
sts="\033[1;32m◉ \033[0m"
else
sts="\033[1;31m○ \033[0m"
fi

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                 INFORMATION MENU                \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;33mAbout\033[0m :

   Isp Name : $ISP
   City     : $CITY
   Time     : $WKT
   IPVPS    : $IPVPS
   
"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m
\033[1;32mPort Information\033[0m :

$sttt

\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m

01. Show Status Bandwidth Server VPS

\033[0;35m[00] Back to Main Menu "
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   vnstat
   read -n 1 -s -r -p "Press any key to back on menu"
   info-menu
   ;;
   
   0 | 00)
   clear
   menu
   ;;
   *)
   info-menu
esac

#fim