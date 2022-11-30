#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://Etil-arya.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "$Akses Diizinkan...${off}"
sleep 1
else
clear
echo -e "$Akses Diblokir!${off}"
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
echo "Checking VPS"
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Cache cleared"
echo ""
echo "Back to menu in 2 sec "
sleep 2
menu
