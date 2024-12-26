# rk3128-note
1. Bật chế độ 4G cho module:
  sudo nmcli c add type gsm ifname ttyUSB2 con-name 4G apn telstra.internet
  sudo nmcli r wwan on
3. Check Module
  ip addr
