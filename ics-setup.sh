#!/bin/bash
echo "ICS Lab Installation"

grn=$'\e[1;32m'
yel=$'\e[1;33m'
end=$'\e[0m'

echo "\n${yel}[*] System Update${end}\n"
sudo apt-get update -y
sudo apt-get upgrade

echo "\n${yel}[*] Installing Dependencies${end}\n"
sudo apt-get install python3 python3-pip vim git ufw -y

echo "\n${yel}[*] Installing Honeypots${end}\n"
sudo pip install honeypots
pip install conpot
sudo pip install python-snap7

echo "\n${yel}[*] Disabling Firewall${end}\n"
sudo ufw disable

echo "\n${yel}[*] Adding Python Binaries to PATH${end}\n"
sudo echo "PATH='$HOME/.local/bin:$PATH'" >> ~/.profile

echo "\n${grn}[+] Installation Complete!${end}\n"
echo "${grn}[!] Reboot System to finalise installation.${end}"