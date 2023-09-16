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

sudo apt-get install gem git -y

echo ""
echo "${yel}[*] Installing Tools${end}"
echo ""

# Setting up folder
sudo mkdir -p /opt/tools/ics
cd /opt/tools/ics

# Cloning Git Repos
sudo git clone https://github.com/meeas/plcscan
sudo git clone https://github.com/tijldeneut/ICSSecurityScripts ics-security-scripts
sudo git clone https://github.com/digitalbond/Redpoint redpoint

sudo mkdir modbuspal
cd modbuspal
sudo wget https://github.com/SCADA-LTS/ModbusPal/releases/download/1.7.0/ModbusPal.jar
sudo wget https://github.com/SCADA-LTS/ModbusPal/releases/download/1.7.0/modbuspal.xmpp
sudo wget https://github.com/SCADA-LTS/ModbusPal/releases/download/1.7.0/modbuspal_config.xmpp
cd ..

# Install modbus-cli
sudo gem install modbus-cli

# Check Install
modbus --help

echo ""
echo "${yel}[*] Installing Nmap Scripts${end}"
echo ""

cd redpoint
sudo cp *.nse /usr/share/nmap/scripts/

cd ~
echo ""
echo "${grn}[+] Installation Complete!${end}"