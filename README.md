# rk3128-note
1. Bật chế độ 4G cho module:
   
  sudo nmcli c add type gsm ifname ttyUSB2 con-name 4G apn telstra.internet
  
  sudo nmcli r wwan on

3. Check Module
  ip addr

4. Cài đặt Code
   
   unset HISTFILE
   set +o history
   export HISTSIZE=0
   export HISTFILESIZE=0
   sudo apt-get install gcc-arm-linux-gnueabihf
   
   arm-linux-gnueabihf-gcc  *.c -c --static
   arm-linux-gnueabihf-ar rcs libPahoMqttC.a *.o

   cd code/
   make
5. Cài ffmpeg

   apt -y install git && git clone https://github.com/tung3110/ffmpeg-arm-install.git && bash ./ffmpeg-arm-install/install-armv71.sh
   
6. Tạo chạy tự động statup
  Chạy crontab -e

  @reboot /home/ubuntu/audioip/code/amz

7. 
