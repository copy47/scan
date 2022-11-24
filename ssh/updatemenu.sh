#!/bin/bash
# ==========================================
# Color
CYAN='\e[0;36m"
GREEN='\e[0;32m"
NC='\e[0;37m"
clear
# download menu
echo -e "$[INFO] ${CYAN} Downloading Update File"
#sleep 2
cd /usr/bin
rm -rf menu
rm -rf ssh-menu
rm -rf trojan-menu
rm -rf vmess-menu
rm -rf vless-menu
wget -q -O ssh-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/ssh-menu.sh"
wget -q -O ssgrpc-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/ssgrpc-menu.sh"
wget -q -O trojan-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/trojan-menu.sh"
wget -q -O vless-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/vless-menu.sh"
wget -q -O vmess-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/vmess-menu.sh"
wget -q -O about "https://raw.githubusercontent.com/copy47/scan/main/ssh/about.sh"
wget -q -O cek "https://raw.githubusercontent.com/copy47/scan/main/ssh/cek.sh"
wget -q -O ceklim "https://raw.githubusercontent.com/copy47/scan/main/ssh/ceklim.sh"
wget -q -O member "https://raw.githubusercontent.com/copy47/scan/main/ssh/member.sh"
wget -q -O menu "https://raw.githubusercontent.com/copy47/scan/main/ssh/menu.sh"
wget -q -O ssh-vpn "https://raw.githubusercontent.com/copy47/scan/main/ssh/ssh-vpn.sh"
wget -q -O usernew "https://raw.githubusercontent.com/copy47/scan/main/ssh/usernew.sh"
wget -q -O autokill "https://raw.githubusercontent.com/copy47/scan/main/ssh/autokill.sh"
wget -q -O delete "https://raw.githubusercontent.com/copy47/scan/main/ssh/delete.sh"
wget -q -O hapus "https://raw.githubusercontent.com/copy47/scan/main/ssh/hapus.sh"
wget -q -O running "https://raw.githubusercontent.com/copy47/scan/main/ssh/running.sh"
wget -q -O updatemenu "https://raw.githubusercontent.com/copy47/scan/main/ssh/updatemenu.sh"
wget -q -O cf "https://raw.githubusercontent.com/copy47/scan/main/ssh/cf.menu"
wget -q -O cekxray "https://raw.githubusercontent.com/copy47/scan/main/xray/cekxray.sh"
wget -q -O ins-xray "https://raw.githubusercontent.com/copy47/scan/main/xray/ins-xray.sh"
wget -q -O crt "https://raw.githubusercontent.com/copy47/scan/main/xray/crt.sh"

chmod +x ssh-menu
chmod +x ssgrpc-menu
chmod +x trojan-menu
chmod +x vless-menu
chmod +x vmess-menu
chmod +x about
chmod +x cek
chmod +x ceklim
chmod +x member
chmod +x menu
chmod +x ssh-vpn
chmod +x usernew
chmod +x autokill
chmod +x delete
chmod +x hapus
chmod +x running
chmod +x updatemenu
chmod +x cf
chmod +x cekxray
chmod +x ins-xray
chmod +x crt
echo -e " [INFO] ${NC}Update Sukses Sayank..!!"
#sleep 2
cd

