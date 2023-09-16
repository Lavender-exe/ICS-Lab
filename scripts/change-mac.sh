#!/bin/bash

echo ""
echo "Select Interface: "
ls /sys/class/net
read interface

echo ""
echo "Selected Interface: ${interface}"
echo ""
echo "Setting ${interface} as DOWN"
sudo ip link set $interface down
echo ""

echo """
[1] Siemens Numerical Control Ltd., Nanjing
[2] AutoGas Systems Inc.
[3] Schneider Electric
[4] Mitra Energy & Infrastructure

[9] Reset MAC Address
"""
# https://gist.github.com/aallan/b4bb86db86079509e6159810ae9bd3e4
siemens_s7="00:1C:06:6B:AB:45"
gas_station="00:A0:F6:75:56:A1"
modbus_electric="00:00:54:FE:B7:DB"
challenge_electric="00:1D:59:FA:A4:D7"

echo ""
echo "Select Device: "
read device

siemens () { 
  sudo macchanger -m $siemens_s7 $interface
  sleep 10
  sudo systemctl restart NetworkManager 2>/dev/null | sudo systemctl restart networking 2>/dev/null | sudo systemctl restart systemd-networkd 2>/dev/null 
}

gas () { 
  sudo macchanger -m $gas_station $interface
  sleep 10
  sudo systemctl restart NetworkManager 2>/dev/null | sudo systemctl restart networking 2>/dev/null | sudo systemctl restart systemd-networkd 2>/dev/null 
}

modbus () { 
  sudo macchanger -m $modbus_electric $interface
  sleep 10
  sudo systemctl restart NetworkManager 2>/dev/null | sudo systemctl restart networking 2>/dev/null | sudo systemctl restart systemd-networkd 2>/dev/null 
}

challenge () { 
  sudo macchanger -m $challenge_electric $interface
  sleep 10
  sudo systemctl restart NetworkManager 2>/dev/null | sudo systemctl restart networking 2>/dev/null | sudo systemctl restart systemd-networkd 2>/dev/null 
}

reset () {
  sudo macchanger -p $interface
  sleep 10
  sudo systemctl restart NetworkManager 2>/dev/null | sudo systemctl restart networking 2>/dev/null | sudo systemctl restart systemd-networkd 2>/dev/null 
}

case $device in
  1) siemens; exit ;;
  2) gas; exit ;;
  3) modbus; exit ;;
  4) challenge; exit ;;
  9) reset; exit;;
  *) echo "Unkown Option" ;;
esac