#!/bin/bash
# ==========================================
# Color
CYAN='\e[0;36m"
GREEN='\e[0;32m"

# download menu
cd /usr/bin
rm -rf menu
rm -rf ssh-menu
rm -rf trojan-menu
rm -rf vmess-menu
rm -rf vless-menu
wget -O ssh-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/ssh-menu.sh"
wget -O ssgrpc-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/ssgrpc-menu.sh"
wget -O trojan-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/trojan-menu.sh"
wget -O vless-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/vless-menu.sh"
wget -O vmess-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/vmess-menu.sh"
wget -O about "https://raw.githubusercontent.com/copy47/scan/main/ssh/about.sh"
wget -O cek "https://raw.githubusercontent.com/copy47/scan/main/ssh/cek.sh"
wget -O ceklim "https://raw.githubusercontent.com/copy47/scan/main/ssh/ceklim.sh"
wget -O member "https://raw.githubusercontent.com/copy47/scan/main/ssh/member.sh"
wget -O menu "https://raw.githubusercontent.com/copy47/scan/main/ssh/menu.sh"
wget -O ssh-vpn "https://raw.githubusercontent.com/copy47/scan/main/ssh/ssh-vpn.sh"
wget -O usernew "https://raw.githubusercontent.com/copy47/scan/main/ssh/usernew.sh"
wget -O autokill "https://raw.githubusercontent.com/copy47/scan/main/ssh/autokill.sh"
wget -O delete "https://raw.githubusercontent.com/copy47/scan/main/ssh/delete.sh"
wget -O hapus "https://raw.githubusercontent.com/copy47/scan/main/ssh/hapus.sh"
wget -O running "https://raw.githubusercontent.com/copy47/scan/main/ssh/running.sh"
wget -O updatemenu "https://raw.githubusercontent.com/copy47/scan/main/ssh/updatemenu.sh"
wget -O cf "https://raw.githubusercontent.com/copy47/scan/main/ssh/cf.menu"
wget -O cekxray "https://raw.githubusercontent.com/copy47/scan/main/xray/cekxray.sh"
wget -O ins-xray "https://raw.githubusercontent.com/copy47/scan/main/xray/ins-xray.sh"
wget -O crt "https://raw.githubusercontent.com/copy47/scan/main/xray/crt.sh"

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

cd

