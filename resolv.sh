#!/data/data/com.termux/files/usr/bin/sh

pkg instal tsu -y

#curl -sSL https://gh.api.99988866.xyz/https://raw.githubusercontent.com/playingapi/cloud139/main/resolv.sh -o resolv.sh && chmod +x resolv.sh && ./resolv.sh


sudo sh -c "echo 'nameserver 114.114.114.114' > /etc/resolv.conf"

echo "update /etc/resolv.conf"

