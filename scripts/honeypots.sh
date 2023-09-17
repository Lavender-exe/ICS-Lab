#!/bin/bash

echo """
[1] Conpot Default - Common Services
[2] Conpot Guardian AST - Gas Station
[3] Conpot Modbus PLC 1
[4] Red Team Engagement
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

echo "Choose Honeypot"
read option
case $option in 
  1) default ;;
  2) guardian_ast ;;
  3) default ;;
  4) red_team ;;
  *) echo "Invalid Option" ;;
esac