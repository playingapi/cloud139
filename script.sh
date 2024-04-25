#!/data/data/com.termux/files/usr/bin/sh

#curl -sSL https://mirror.ghproxy.com/https://raw.githubusercontent.com/playingapi/cloud139/main/script.sh -o script.sh && chmod +x script.sh && ./script.sh

pkg instal termux-services tsu -y
apt install -y wget 

wget https://mirror.ghproxy.com/https://github.com/ykxVK8yL5L/alist/releases/latest/download/alist-linux-musl-arm64.tar.gz
tar -zxvf alist-linux-musl-arm64.tar.gz

./alist admin set admin

echo "alist:"
echo "user: admin" 
echo "password: admin" 

sed -i 's/5224/10002/g' data/config.json

#sudo sh -c "echo 'nameserver 114.114.114.114' > /etc/resolv.conf"
echo "请用MT管理器修改/etc/resolv.conf,并写入nameserver 114.114.114.114 "

mkdir -p $PREFIX/var/service/alist
mkdir -p $PREFIX/var/service/alist/log

ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/alist/log/run
cat <<- EOF > $PREFIX/var/service/alist/run
#!/data/data/com.termux/files/usr/bin/sh
exec 2>&1
cd ~ && ~/alist server
EOF

chmod a+x $PREFIX/var/service/alist/run

sv-enable alist
sv up alist

echo "请重启termux"
