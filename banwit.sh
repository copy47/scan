#!/bin/bash
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
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;36m      • BANDWITH MONITOR •         \E[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" 
echo -e " [\e[32m•1\e[0m] Lihat Total Bandwith Tersisa"
echo -e " [\e[32m•2\e[0m] Tabel Penggunaan Setiap 5 Menit"
echo -e " [\e[32m•3\e[0m] Tabel Penggunaan Setiap Jam"
echo -e " [\e[32m•4\e[0m] Tabel Penggunaan Setiap Hari"
echo -e " [\e[32m•5\e[0m] Tabel Penggunaan Setiap Bulan"
echo -e " [\e[32m•6\e[0m] Tabel Penggunaan Setiap Tahun"
echo -e " [\e[32m•7\e[0m] Tabel Penggunaan Tertinggi"
echo -e " [\e[32m•8\e[0m] Statistik Penggunaan Setiap Jam"
echo -e " [\e[32m•9\e[0m] Lihat Penggunaan Aktif Saat Ini"
echo -e " [\e[32m10\e[0m] Lihat Trafik Penggunaan Aktif Saat Ini [5s]"
echo -e "" 
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e " [\e[31m•x\e[0m] Keluar"
echo -e "" 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m • TOTAL BANDWITH SERVER TERSISA • \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

2)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m • TOTAL BANDWITH SETIAP 5 MENIT • \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -5

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

3)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m   • TOTAL BANDWITH SETIAP JAM •   \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -h

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

4)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m  • TOTAL BANDWITH SETIAP HARI •   \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -d

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

5)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m  • TOTAL BANDWITH SETIAP BULAN •  \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -m

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

6)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m  • TOTAL BANDWITH SETIAP TAHUN •  \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -y

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

7)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m    • TOTAL BANDWITH TERTINGGI •   \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -t

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

8)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m • STATISTIK TERPAKAI SETIAP JAM • \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -hg

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

9)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m     • LIVE BANDWITH SAAT INI •    \e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   " Press [ Ctrl+C ] • To-Exit"
echo -e ""

vnstat -l

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

10)
clear 
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;33m• LIVE TRAFIK PENGGUNAAN BANDWITH •\e[0m"
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

vnstat -tr

echo -e ""
echo -e "\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
banwit
;;

0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "Anda salah tekan"
sleep 1
banwit
;;
esac
