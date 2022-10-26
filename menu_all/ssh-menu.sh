#!/bin/bash
#########################
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
IP=$(curl -sS ifconfig.me)

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
chck_pid(){
	PID=`ps -ef |grep -v grep | grep dropbear |awk '{print $2}'`
}
menu_sts(){
	if dpkg -s dropbear > /dev/null 2>&1; then
		chck_pid
		if [[ ! -z "${PID}" ]]; then
			echo -e "\033[0;33mStatus dropbear Ws: ${Green_font_prefix} Installed${Font_color_suffix} & ${Green_font_prefix}Running${Font_color_suffix}"
		else
			echo -e "\033[0;33mSatus dropbear Ws: ${Green_font_prefix} Installed${Font_color_suffix} but ${Red_font_prefix}Not Running${Font_color_suffix}"
		fi
	#	cd "${ssr_folder}"
	else
		echo -e "\033[0;33mStatus dropbear Ws: ${Red_font_prefix}Not Installed${Font_color_suffix}"
	fi

}
while true $x != "ok"
do
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                      SSH MENU                     \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
menu_sts
chck_sshwb
echo -e "
01. Create SSH & OpenVPN Account
02. Trial SSH & OpenVPN Account
03. Renew SSH & OpenVPN Account 
04. Delete SSH & OpenVPN Account
05. Check User Login SSH & OpenVPN
06. List of Member SSH & OpenVPN
07. Delete User Expired SSH & OpenVPN
08. Displays Users Who Do Multi Login SSH
09. Set Autokill
10. Enable/Disable SSH Websocket $sts

\033[0;35m[00] • Kembali Ke Menu "
echo ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   usernew
   break
   ;;
   2 | 02)
   clear
   trial
   break
   ;;
   3 | 03)
   clear
   renew
   break
   ;;
   4 | 04)
   clear
   hapus
   break
   ;;
   5 | 05)
   clear
   cek
   break
   ;;
   6 | 06)
   clear
   member
   break
   ;;
   7 | 07)
   clear
   delete
   break
   ;;
   8 | 08)
   clear
   ceklim
   break
   ;;
   9 | 09)
   clear
   autokill
   break
   ;;
   10 | 10)
   clear
   sshws
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