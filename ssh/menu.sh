#!/bin/bash
# Menu For Script
# Edition : Stable Edition V1.0
#=========================
#######################

BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\e[31m'
NC='\e[0m'

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-epro | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
clear
clear
clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       INFORMASI VPS                          \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e "Sever Uptime        ${BLUE}•${NC} $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "Current Time        ${BLUE}•${NC} $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    ${BLUE}•${NC} $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Current Domain      ${BLUE}•${NC} $( cat /etc/xray/domain )"
echo -e "Server IP           ${BLUE}•${NC} ${IP}"
echo -e "Total Amount Of Ram ${BLUE}•${NC} $tram MB"
echo -e "Used Ram            ${BLUE}•${NC} $uram MB"
echo -e "Free Ram            ${BLUE}•${NC} $fram MB"
echo -e "Clients Name        ${BLUE}•${NC} Arya"
echo -e "Exp Script VPS      ${BLUE}•${NC} Lifetime"
echo -e "Time Reboot VPS     ${BLUE}•${NC} 00.24"
echo -e "AutoScript          ${BLUE}•${NC} Arya Blitar"
echo -e "handpone/wa         ${BLUE}•${NC} 087721815317"


echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       STATUS LAYANAN                        \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [ ${NC}SSH WebSocket${GREEN} : ON ]     [ ${NC}XRAY${GREEN} : ${status_xray} ]      [ ${NC}NGINX${GREEN} : ${status_nginx} ]"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       MENU LAYANAN                           \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${BLUE} •${NC} Panel Ssh Websoket $NC  [${GREEN}08${NC}]${BLUE} • ${NC}Cek Status Vps $NC"
echo -e " [${GREEN}02${NC}]${BLUE} •${NC} Panel Vmess $NC         [${GREEN}09${NC}]${BLUE} • ${NC}Info Port Install $NC"
echo -e " [${GREEN}03${NC}]${BLUE} •${NC} Panel Vless $NC         [${GREEN}10${NC}]${BLUE} • ${NC}Info Auto Install $NC"
echo -e " [${GREEN}04${NC}]${BLUE} •${NC} Panel Trojan $NC        [${GREEN}11${NC}]${BLUE} • ${NC}Cek Speedtest $NC"
echo -e " [${GREEN}05${NC}]${BLUE} •${NC} Panel Sadowsock $NC     [${GREEN}12${NC}]${BLUE} • ${NC}Change Banner $NC"
echo -e " [${GREEN}06${NC}]${BLUE} •${NC} Add Subdomain Vps $NC   [${GREEN}13${NC}]${BLUE} • ${NC}Cek Bandwidth Vps $NC"
echo -e " [${GREEN}07${NC}]${BLUE} •${NC} Renew Certv2ray $NC     [${GREEN}14${NC}]${BLUE} • ${NC}Reboot $NC"
echo -e " ${BLUE}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                    SCRIPT ARYA BLITAR                        \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e ""

read -p "Select From Options [ 1 - 14 ] : " menu
case $menu in
1)
clear
ssh-menu
;;
2)
clear
vmess-menu
;;
3)
clear
vless-menu
;;
4)
clear
trojan-menu
;;
5)
clear
ssgrpc-menu
;;
6)
clear
add-host
;;
7)
clear
certv2ray
;;
8)
clear
running
;;
9)
clear
info-menu
;;
10)
clear
about
;;
11)
clear
speedtest
;;
12)
clear
banner
;;
13)
clear
vnstat -d
;;
14)
reboot
exit
;;
*)
clear
menu
;;
esac
