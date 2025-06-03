#!/bin/sh
sed -i 's/^%sudoALL=/%sudo ALL=/' /etc/sudoers
sed -i 's|^ExecStart=/usr/sbin/ModemManager|ExecStart=/usr/sbin/ModemManager --debug|' /lib/systemd/system/ModemManager.service
systemctl daemon-reexec
systemctl restart ModemManager
echo "ubuntu ALL=(ALL) NOPASSWD: /usr/bin/mmcli" > /etc/sudoers.d/ubuntu-mmcli
chmod 440 /etc/sudoers.d/ubuntu-mmcli
echo 'KERNEL=="ttyS1", MODE="0666"' > /etc/udev/rules.d/99-ttyS1.rules
udevadm control --reload
udevadm trigger
service ntp restart
apt update
sudo apt -y full-upgrade
apt -y install --reinstall modemmanager
unset HISTFILE
set +o history
unset DISPLAY
export HISTSIZE=0
export HISTFILESIZE=0
apt -y install iputils-ping
apt -y install alsa-utils
apt -y install unzip
apt-get -y install gcc-arm-linux-gnueabihf
apt -y install git && git clone https://github.com/tung3110/ffmpeg-arm-install.git && bash ./ffmpeg-arm-install/install-armv71.sh
#git clone https://github.com/tung3110/rk3128-note.git
#cd rk3128-note
unzip code.zip
#arm-linux-gnueabihf-gcc  *.c -c --static
#arm-linux-gnueabihf-ar rcs libPahoMqttC.a *.o
#cd code/
#make
sudo systemctl enable ModemManager
sudo systemctl start ModemManager
sudo nmcli c add type gsm ifname ttyUSB2 con-name 4G apn telstra.internet
sudo nmcli r wwan on
wget https://dl.min.io/client/mc/release/linux-arm/mc --no-check-certificate
sudo chmod a+x mc
sudo mv mc /usr/local/bin
chmod +x minio_upload.sh
echo "ubuntu ALL=(ALL) NOPASSWD: /home/ubuntu/rk3128-note/minio_upload.sh" > /etc/sudoers.d/minio-upload
chmod 440 /etc/sudoers.d/minio-upload
(crontab -l 2>/dev/null; echo "@reboot /home/ubuntu/rk3128-note/amz") | crontab -
