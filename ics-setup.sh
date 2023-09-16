#!/bin/bash
echo "ICS Lab Installation"

grn=$'\e[1;32m'
yel=$'\e[1;33m'
end=$'\e[0m'

echo ""
echo "${yel}[*] System Update${end}"
echo ""

sudo apt-get update -y
sudo apt-get upgrade

echo ""
echo "${yel}[*] Installing Dependencies${end}"
echo ""

sudo apt-get install python3 python3-pip vim git ufw -y

echo ""
echo "${yel}[*] Installing Honeypots${end}"
echo ""

sudo pip install honeypots
pip install conpot
sudo pip install python-snap7

echo ""
echo "${yel}[*] Disabling Firewall${end}"
echo ""

sudo ufw disable

echo ""
echo "${yel}[*] Adding Python Binaries to PATH${end}"
echo ""

sudo echo "PATH='$HOME/.local/bin:$PATH'" >> ~/.profile

echo ""
echo "${grn}[+] Installation Complete!${end}"
echo "${grn}[!] Reboot System to finalise installation.${end}"