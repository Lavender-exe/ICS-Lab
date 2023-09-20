# ICS-Lab
Lab setup for practicing Industrial Control System Pentesting.

Based on the course: [Practical Industrial Control System Penetration Testing](https://www.udemy.com/course/practical-ics-pentesting/)

# Virtual Machine Setup

[VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Requirements

Minimum:
- 12GB RAM (Kali: 8GB, Ubuntu Server: 1GB)
- 4 Cores (Kali: 2-4 Cores, Ubuntu Server: 1 Core)

### Attacker

*You can use anything you'd like*

- Clone the installation script [kali-setup.sh](https://github.com/Lavender-exe/ICS-Lab/blob/main/setup/kali-setup.sh)
- `chmod +x kali-setup.sh`
- `./kali-setup.sh`

### Lab

[Ubuntu Server 23.04 ](https://ubuntu.com/download/server)
- Install the minimal setup to use less resources
- Clone the installation script [ics-setup.sh](https://github.com/Lavender-exe/ICS-Lab/blob/main/setup/ics-setup.sh)
- `chmod +x ics-setup.sh`
- `./ics-setup.sh`

## Network

### Create NAT Network

1. File -> Tools -> Network Manager -> NAT Networks
2. Right Click in the blank space and click create (or Ctrl + Shift + C)
3. Name it `ICSNetwork`
4. Use any subnet (I Used 192.168.10.0/24)
5. Enable DHCP

### Set Adapter

Do this for your lab server to allow the installation of updates and applications
- Settings -> Network -> Adapter 2 -> NAT Network & Select `ICSNetwork`

After running the install script, switch the adapter to `Internal Network`.Make sure to have the same name for the lab and your pentesting system. Do the same for the attacker machine on a seperate adapter (e.g. Adapter 2).

# Running Honeypots

Check the Scripts Directory:
- [change-mac.sh](https://github.com/Lavender-exe/ICS-Lab/blob/main/scripts/change-mac.sh) changes your MAC Address to fit the device you're attacking
- [honeypots.sh](https://github.com/Lavender-exe/ICS-Lab/blob/main/scripts/honeypots.sh) allows you to select which scenario you'd like to test
- [s7.py](https://github.com/Lavender-exe/ICS-Lab/blob/main/scripts/s7.py) starts an S7 server to test the Siemens PLC
