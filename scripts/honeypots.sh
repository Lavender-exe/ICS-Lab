#!/bin/bash

if (( $EUID != 0 )); then
    echo "[-] Please run as root"
    exit
fi

echo """
[1] Conpot Default - Common Services
[2] Conpot Guardian AST - Gas Station
[3] Conpot Modbus PLC 1
[4] Red Team Engagement
[5] S7 Siemens PLC Server
"""

default() {
  conpot -f --template default
}
guardian_ast() {
  conpot -f --template guardian_ast
}
red_team() {
  conpot -f --template IEC104
}

s7_siemens() {
  sudo python3 s7.py
}

echo -e "[i] Choose Honeypot: \n"
read option
case $option in 
  1) default ;;
  2) guardian_ast ;;
  3) default ;;
  4) red_team ;;
  5) s7_siemens;;
  *) echo "Invalid Option" ;;
esac