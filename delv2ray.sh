#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://Etil-arya.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${GREEN}Akses Diizinkan...${off}"
sleep 1
else
clear
echo -e "${RED}Akses Diblokir!${off}"
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${ORANGE}              • HAPUS XRAY USER •                                             ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${RED}                      • Tidak Ada User!" •                                                            ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}" 
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${GREEN} Sc Arya Blitar                                            ${BLUE}│${NC}""
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi
clear
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${ORANGE}              • DELETE XRAY USER •               ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "${BLUE}│${NC}"
echo -e "${BLUE}│${NC}  • [NOTE] Press any key to back on menu"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}───────────────────────────────────────────────────${NC}"
read -rp "   Input Username : " user
if [ -z $user ]; then
menu
else
user=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
rm -f /etc/xray/vmess-$user-tls.json /etc/xray/vmess-$user-nontls.json
systemctl restart xray.service
clear
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${ORANGE}              • DELETE XRAY USER •               ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${CYAN}   • Account Berhasil Dihapus"
echo -e "${BLUE}│${NC}"
echo -e "${BLUE}│${NC}   • Client Name : $user"
echo -e "${BLUE}│${NC}   • Expired On  : $exp"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}" 
echo -e "${BLUE}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│${GREEN} Sc Arya Blitar                                  ${BLUE}│${NC}"
echo -e "${BLUE}└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
