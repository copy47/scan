#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0;37m'
KN='\033[0;33m'
BURIQ () {
    curl -sS https://raw.githubusercontent.com/copy47/scan/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/copy47/scan/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/copy47/scan/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/copy47/scan/main/ip | grep $MYIP | awk '{print $3}')
fi
# // Exporting Language to UTF-8
#export LC_ALL='en_US.UTF-8'
#export LANG='en_US.UTF-8'
#export LANGUAGE='en_US.UTF-8'
#export LC_CTYPE='en_US.utf8'

# // Export Color & Information
#export RED='\033[0;31m'
#export GREEN='\033[0;32m'
#export YELLOW='\033[0;33m'
#export BLUE='\033[0;34m'
#export PURPLE='\033[0;35m'
#export CYAN='\033[0;36m'
#export LIGHT='\033[0;37m'
#export NC='\033[0m'

# // Export Banner Status Information
#export EROR="[${RED} EROR ${NC}]"
#export INFO="[${YELLOW} INFO ${NC}]"
#export OKEY="[${GREEN} OKEY ${NC}]"
#export PENDING="[${YELLOW} PENDING ${NC}]"
#export SEND="[${YELLOW} SEND ${NC}]"
#export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
#export BOLD="\e[1m"
#export WARNING="${RED}\e[5m"
#export UNDERLINE="\e[4m"

# // Exporting URL Host
#export Server_URL="autosc.me/aio"
#export Server_Port="443"
#export Server_IP="underfined"
#export Script_Mode="Stable"
#export Auther="XdrgVPN"

# // Root Checking
#if [ "${EUID}" -ne 0 ]; then
		#echo -e "${EROR} Please Run This Script As Root User !"
		#exit 1
#fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // SSH Websocket Proxy
#ssh_ws=$( systemctl status wstls | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
#if [[ $ssh_ws == "running" ]]; then
#    status_ws="${GREEN}ON${NC}"
#else
#    status_ws="${RED}OFF${NC}"
#fi

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
#ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
clear
clear
echo -e ""
echo -e ""
echo -e "\E[44;1;39m ꧁࿇ SCRIPT SEDERHANA PENUH CINTA ࿇꧂  \E[0m"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       INFORMASI VPS                          \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

#echo -e "ISP Name            ${BLUE}•${NC} $ISP"
echo -e "Current Time        ${BLUE}•${NC} $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    ${BLUE}•${NC} $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Current Domain      ${BLUE}•${NC} $( cat /etc/xray/domain )"
echo -e "Server IP           ${BLUE}•${NC} ${IP}"
echo -e "Total Amount Of Ram ${BLUE}•${NC} $tram MB"
echo -e "Used Ram            ${BLUE}•${NC} $uram MB"
echo -e "Free Ram            ${BLUE}•${NC} $fram MB"
echo -e "Clients Name        ${BLUE}•${NC} $Name"
echo -e "Exp Script VPS      ${BLUE}•${NC} $Exp"
echo -e "Time Reboot VPS     ${BLUE}•${NC} 00.24"
echo -e "AutoScript          ${BLUE}•${NC} Arya Blitar"
echo -e "handpone/wa         ${BLUE}•${NC} 087721815317"
echo -e "Version             ${BLUE}•${KN} Multiport"

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       STATUS LAYANAN                        \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [ ${KN}SSH WebSocket${GREEN} : ON ${NC}]     [ ${KN}XRAY${NC} : ${status_xray} ]      [ ${KN}NGINX${GREEN} : ${status_nginx} ]"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       MENU LAYANAN                           \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${BLUE} •${NC} Ssh Websoket $NC        [${GREEN}11${NC}]${BLUE} • ${NC}Info Port Install $NC"
echo -e " [${GREEN}02${NC}]${BLUE} •${NC} Vmess $NC               [${GREEN}12${NC}]${BLUE} • ${NC}Info Auto Install $NC"
echo -e " [${GREEN}03${NC}]${BLUE} •${NC} Vless $NC               [${GREEN}13${NC}]${BLUE} • ${NC}Cek Speedtest $NC"
echo -e " [${GREEN}04${NC}]${BLUE} •${NC} Trojan $NC              [${GREEN}14${NC}]${BLUE} • ${NC}Change Banner $NC"
echo -e " [${GREEN}05${NC}]${BLUE} •${NC} Sadowsock $NC           [${GREEN}15${NC}]${BLUE} • ${NC}Restart Banner $NC"
echo -e " [${GREEN}06${NC}]${BLUE} •${NC} Add Subdomain Vps $NC   [${GREEN}16${NC}]${BLUE} • ${NC}Monitor Total Banwith $NC"
echo -e " [${GREEN}07${NC}]${BLUE} •${NC} Renew Certv2ray $NC     [${GREEN}17${NC}]${BLUE} • ${NC}Cek Usage Xray $NC"
echo -e " [${GREEN}08${NC}]${BLUE} •${NC} Reboot $NC              [${GREEN}18${NC}]${BLUE} • ${NC}Seting Time Reboot $NC"
echo -e " [${GREEN}09${NC}]${BLUE} •${NC} Run Frekuensi $NC       [${GREEN}19${NC}]${BLUE} • ${NC}Info Update Menu $NC"
echo -e " [${GREEN}10${NC}]${BLUE} •${NC} Cek Status Vps $NC      [${GREEN}20${NC}]${BLUE} • ${NC}Kluar $NC"
echo -e " ${BLUE}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                 ꧁࿇ SCRIPT ARYA BLITAR ࿇꧂                     \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e ""

read -p "Select From Options [ 1 - 20 ] : " menu
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
crt
;;
8)
clear
reboot
;;
9)
clear
htop
;;
10)
clear
running
;;
11)
clear
info-menu
;;
12)
clear
about
;;
13)
clear
speedtest
;;
14)
clear
nano /etc/issue.net
;;
15)
clear
/etc/init.d/dropbear restart
;;
16)
clear
banwit
;;
17)
clear
cekusage
;;
18)
auto-reboot
;;
19)
updatemenu
;;
20)
exit
exit
;;
*)
clear
menu
;;
esac
