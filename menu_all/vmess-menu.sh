#!/bin/bash
#########################
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
green='\e[32m'
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                     XRAY MENU                    \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

rekk='XRAY'
kjj='xray'
else
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                     V2RAY MENU                     \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

rekk='V2RAY'
kjj='v2ray'
fi
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
chck_pid(){
	PID=`ps -ef |grep -v grep | grep $kjj |awk '{print $2}'`
}
menu_sts(){
	if [[ -e /usr/bin/$kjj ]]; then
		chck_pid
		if [[ ! -z "${PID}" ]]; then
			echo -e "\033[0;33mStatus: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Jalan${Font_color_suffix}"
		else
			echo -e "\033[0;33mStatus: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Busuk${Font_color_suffix}"
		fi
	#	cd "${ssr_folder}"
	else
		echo -e "\033[0;33mStatus: ${Red_font_prefix}Not Installed${Font_color_suffix}"
	fi
}

while true $x != "ok"
do
cek=/home/shws
if [[ -f "$cek" ]]; then
sts="\033[1;32m◉ \033[0m"
else
sts="\033[1;31m○ \033[0m"
fi

menu_sts
echo -e "
01. Create $rekk Vmess Websocket Account
02. Deleting $rekk Vmess Websocket Account
03. Extending $rekk Vmess Account Active Life
04. Check User Login $rekk
\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m

\033[0;35m[00] • Back to Main Menu "
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   add-ws
   break
   ;;
   2 | 02)
   clear
   del-ws 
   break
   ;;
   3 | 03)
   clear
   renew-ws
   break
   ;;
   4 | 04)
   clear
   cek-ws
   break
   ;;
   0 | 00)
   clear
   menu
   break
   ;;
   *)
   clear
esac
done
#fim
