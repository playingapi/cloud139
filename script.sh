#!/data/data/com.termux/files/usr/bin/sh

#curl -sSL https://gh.api.99988866.xyz/https://raw.githubusercontent.com/playingapi/cloud139/main/script.sh -o script.sh && chmod +x script.sh && ./script.sh

pkg instal termux-services vim tsu -y
apt install -y wget 

wget https://gh.api.99988866.xyz/https://github.com/ykxVK8yL5L/alist/releases/download/v0.0.1/alist-linux-musl-arm64.tar.gz
tar -zxvf alist-linux-musl-arm64.tar.gz

./alist admin set admin password

sed -i 's/5224/10002/g' data/config.json

sudo sh -c "echo 'nameserver 114.114.114.114' > /etc/resolv.conf"

mkdir -p $PREFIX/var/service/alist
mkdir -p $PREFIX/var/service/alist/log

ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/alist/log/run
cat <<- EOF > $PREFIX/var/service/alist/run
#!/data/data/com.termux/files/usr/bin/sh
exec 2>&1
cd ~ && ~/alist server
EOF

chmod a+x $PREFIX/var/service/alist/run

echo "请重启termux, 再输入sv-enable alist 和 sv up alist"
