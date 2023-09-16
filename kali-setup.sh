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
echo "[*] Installing Tools"
echo ""

# Setting up folder
sudo mkdir -p /opt/tools/ics
cd /opt/tools/ics

# Cloning Git Repos
sudo git clone https://github.com/meeas/plcscan
sudo git clone https://github.com/tijldeneut/ICSSecurityScripts ics-security-scripts
sudo git clone https://github.com/digitalbond/Redpoint redpoint
sudo git clone https://github.com/SCADA-LTS/ModbusPal modbuspal

# Install modbus-cli
sudo gem install modbus-cli

# Check Install
modbus --help

echo ""
echo "${yel}[*] Installing Nmap Scripts${end}"
echo ""

cd redpoint
sudo cp *.nse /usr/share/nmap/scripts/

echo ""
echo "${grn}[+] Installation Complete!${end}"