#!/bin/sh
sudo nmcli c add type gsm ifname ttyUSB2 con-name 4G apn telstra.internet
sudo nmcli r wwan on
unset HISTFILE
set +o history
export HISTSIZE=0
export HISTFILESIZE=0
apt install iputils-ping
apt install alsa-utils
apt-get install gcc-arm-linux-gnueabihf
apt -y install git && git clone https://github.com/tung3110/ffmpeg-arm-install.git && bash ./ffmpeg-arm-install/install-armv71.sh
git clone https://github.com/tung3110/rk3128-note.git
cd rk3128-note
unzip audioip.zip
arm-linux-gnueabihf-gcc  *.c -c --static
arm-linux-gnueabihf-ar rcs libPahoMqttC.a *.o
cd code/
make
