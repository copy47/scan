#!/bin/bash
#
# ==================================================

# initializing var
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
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=none
organization=none
organizationalunit=none
commonname=none
email=admin@bahenol

# simple password minimal
curl -sS https://raw.githubusercontent.com/copy47/scan/main/ssh/password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

#install python
apt install python -y

#install jq
apt -y install jq

#install shc
apt -y install shc

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config


install_ssl(){
    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            else
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            fi
    else
        yum install -y nginx certbot
        sleep 3s
    fi

    systemctl stop nginx.service

    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            else
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            fi
    else
        echo "Y" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
        sleep 3s
    fi
}

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/copy47/scan/main/ssh/nginx.conf"
mkdir -p /home/vps/public_html
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/copy47/scan/main/ssh/newudpgw"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'
# /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart

echo "=== Install Dropbear ==="
# install dropbear
#apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart

cd
# install stunnel 5 
cd /root/
wget -q -O stunnel5.zip "https://${akbarvpnnnn}/stunnel5.zip"
unzip -o stunnel5.zip
cd /root/stunnel
chmod +x configure
./configure
make
make install
cd /root
rm -r -f stunnel
rm -f stunnel5.zip
mkdir -p /etc/stunnel5
chmod 644 /etc/stunnel5

# Download Config Stunnel5
cat > /etc/stunnel5/stunnel5.conf <<-END
cert = /etc/xray/xray.crt
key = /etc/xray/xray.key
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:22

[dropbear]
accept = 777
connect = 127.0.0.1:109

[ws-stunnel]
accept = 2096
connect = 700

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
# Service Stunnel5 systemctl restart stunnel5
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://stunnel.org
Documentation=https://github.com/fsvpn
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/bin/stunnel5 /etc/stunnel5/stunnel5.conf
Type=forking

[Install]
WantedBy=multi-user.target
END

# Service Stunnel5 /etc/init.d/stunnel5
wget -q -O /etc/init.d/stunnel5 "https://${akbarvpnnnn}/stunnel5.init"

# Ubah Izin Akses
chmod 600 /etc/stunnel5/stunnel5.pem
chmod +x /etc/init.d/stunnel5
cp /usr/local/bin/stunnel /usr/local/bin/stunnel5

# Remove File
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
#rm -f /usr/local/bin/stunnel5

# Restart Stunnel 5
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
sleep 1
echo -e "[ ${green}INFO$NC ] Settings banner"
wget -q -O /etc/issue.net "https://raw.githubusercontent.com/copy47/scan/main/issue.net"
chmod +x /etc/issue.net
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
cat> /etc/issue.net << END
<br></font><font color="#9ACD32">◆ Arya Aris Setya Udanawu<br></font><font color="#F433FF">★ —-«« Order Ssh Premium Sg & Indo »»—- ★<br></font><font color="#00FF7F">☪ wa. 087721815317<br>
END

#install bbr dan optimasi kernel
wget https://raw.githubusercontent.com/copy47/scan/main/ssh/bbr.sh && chmod +x bbr.sh && ./bbr.sh

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O usernew "https://raw.githubusercontent.com/copy47/scan/main/ssh/usernew.sh"
wget -O cok "https://raw.githubusercontent.com/copy47/scan/main/ssh/cok.sh"
wget -O updatemenu "https://raw.githubusercontent.com/copy47/scan/main/ssh/updatemenu.sh"
wget -O hapus "https://raw.githubusercontent.com/copy47/scan/main/ssh/hapus.sh"
wget -O delete "https://raw.githubusercontent.com/copy47/scan/main/ssh/delete.sh"
wget -O member "https://raw.githubusercontent.com/copy47/scan/main/ssh/member.sh"
wget -O renew "https://raw.githubusercontent.com/copy47/scan/main/ssh/renew.sh"
wget -O cek "https://raw.githubusercontent.com/copy47/scan/main/ssh/cek.sh"
#wget -O cektrgo "https://raw.githubusercontent.com/copy47/scan/main/ssh/cektrgo"
wget -O add-host "https://raw.githubusercontent.com/copy47/scan/main/ssh/add-host.sh"
wget -O speedtest "https://raw.githubusercontent.com/copy47/scan/main/ssh/speedtest_cli.py"
wget -O xp "https://raw.githubusercontent.com/copy47/scan/main/ssh/xp.sh"
wget -O babi "https://raw.githubusercontent.com/copy47/scan/main/ssh/babi.sh"
wget -O menu "https://raw.githubusercontent.com/copy47/scan/main/ssh/menu.sh"
wget -O sshws "https://raw.githubusercontent.com/copy47/scan/main/ssh/sshws.sh"
wget -O trial "https://raw.githubusercontent.com/copy47/scan/main/ssh/trial.sh"
wget -O cekusage "https://raw.githubusercontent.com/copy47/scan/main/ssh/cekusage.sh"
wget -O grpc "https://raw.githubusercontent.com/copy47/scan/main/ssh/grpc.sh"
wget -O autokill "https://raw.githubusercontent.com/copy47/scan/main/ssh/autokill.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/copy47/scan/main/ssh/auto-reboot.sh"
wget -O banwit "https://raw.githubusercontent.com/copy47/scan/main/ssh/banwit.sh"
wget -O ssh-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/ssh-menu.sh"
wget -O vmess-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/vmess-menu.sh"
wget -O vless-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/vless-menu.sh"
wget -O trojan-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/trojan-menu.sh"
wget -O ssgrpc-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/ssgrpc-menu.sh"
#wget -O cek-ws "https://raw.githubusercontent.com/copy47/scan/main/xray/cek-ws.sh"
wget -O cekxray "https://raw.githubusercontent.com/copy47/scan/main/xray/cekxray.sh"
#wget -O cek-cekvless "https://raw.githubusercontent.com/copy47/scan/main/xray/cek-vless"
#wget -O cek-vmess "https://raw.githubusercontent.com/copy47/scan/main/xray/cek-vmess"
wget -O about "https://raw.githubusercontent.com/copy47/scan/main/ssh/about.sh" 
wget -O running "https://raw.githubusercontent.com/copy47/scan/main/ssh/running.sh"
wget -O banner "https://raw.githubusercontent.com/copy47/scan/main/ssh/banner.sh"
wget -O del-tr "https://raw.githubusercontent.com/copy47/scan/main/xray/del-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/copy47/scan/main/xray/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/copy47/scan/main/xray/del-vless.sh"
wget -O renew-ws "https://raw.githubusercontent.com/copy47/scan/main/xray/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/copy47/scan/main/xray/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/copy47/scan/main/xray/renew-tr.sh"
#wget -O trial-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/trial-menu.sh"
wget -O info-menu "https://raw.githubusercontent.com/copy47/scan/main/menu_all/info-menu.sh"
wget -O ceklim "https://raw.githubusercontent.com/copy47/scan/main/ssh/ceklim.sh"
wget -O crt "https://raw.githubusercontent.com/copy47/scan/main/xray/crt.sh"

chmod +x usernew
chmod +x cekusage
chmod +x menu
chmod +x cok
chmod +x hapus
chmod +x delete
chmod +x member
chmod +x cekxray
chmod +x renew
chmod +x cek
chmod +x add-host
chmod +x speedtest
chmod +x xp
chmod +x babi
chmod +x sshws
chmod +x trial
chmod +x ssh-menu
chmod +x vmess-menu
chmod +x vless-menu
chmod +x trojan-menu
chmod +x ssgrpc-menu
chmod +x auto-reboot
chmod +x banwit
chmod +x updatemenu
chmod +x about
chmod +x running
chmod +x banner
chmod +x del-tr
chmod +x del-ws
chmod +x del-vless
chmod +x crt
chmod +x info-menu
chmod +x ceklim
chmod +x autokill
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
cd


cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 7 * * * root /sbin/reboot
END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 0 * * * root /usr/bin/xp
END

cat > /home/re_otm <<-END
7
END

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

# remove unnecessary files
sleep 1
echo -e "[ ${green}INFO$NC ] Clearing trash"
apt autoclean -y >/dev/null 2>&1

if dpkg -s unscd >/dev/null 2>&1; then
apt -y remove --purge unscd >/dev/null 2>&1
fi

# apt-get -y --purge remove samba* >/dev/null 2>&1
# apt-get -y --purge remove apache2* >/dev/null 2>&1
# apt-get -y --purge remove bind9* >/dev/null 2>&1
# apt-get -y remove sendmail* >/dev/null 2>&1
# apt autoremove -y >/dev/null 2>&1
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "$yell[SERVICE]$NC Restart All service SSH & OVPN"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx"
/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/ssh restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat "
/etc/init.d/squid restart >/dev/null 2>&1

screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile


rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh

# finihsing
clear
