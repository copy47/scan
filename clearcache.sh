#!/bin/bash
#jancok
MYIP=$(wget -qO- ipinfo.io/ip);

echo ""
echo ""
echo -e "\033[0;36mClear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "\033[32mCache cleared"
echo ""
echo "Back to menu in 2 sec "
sleep 2
menu
