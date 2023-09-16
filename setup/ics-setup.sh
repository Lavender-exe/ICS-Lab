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

sudo apt-get install -y python3 python3-pip vim git ufw snmpd snmp libsnmp-dev vsftpd net-tools 

echo ""
echo "${yel}[*] Installing Honeypots${end}"
echo ""

sudo pip install honeypots
pip install conpot
sudo pip install python-snap7
cd ~/.local/lib/python3.10/site-packages/conpot/templates/IEC104/snmp/
rm snmp.xml
wget https://raw.githubusercontent.com/mushorg/conpot/master/conpot/templates/IEC104/snmp/snmp.xml

echo ""
echo "${yel}[*] Disabling Firewall${end}"
echo ""

sudo ufw disable

echo ""
echo "${yel}[*] Adding Python Binaries to PATH${end}"
echo ""

sudo echo "PATH='$HOME/.local/bin:$PATH'" >> ~/.profile

echo ""
echo "${yel}[*] Starting Services${end}"
echo ""

sudo systemctl enable snmpd
sudo systemctl enable vsftpd.service

sudo systemctl status snmpd
sudo systemctl status vsftp

echo ""
echo "${yel}[*] Installing MAC Changer${end}"
echo ""

sudo apt-get install macchanger
echo "${yel}Select 'No'${end}"

echo ""
echo "${grn}[+] Installation Complete!${end}"
echo "${grn}[!] Reboot System to finalise installation.${end}"