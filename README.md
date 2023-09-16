# ICS-Lab
Lab setup for practicing Industrial Control System Pentesting
Based on the course: [Practical Industrial Control System Penetration Testing](https://www.udemy.com/course/practical-ics-pentesting/)

# Virtual Machine Setup

[VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Requirements

Minimum:
- 12gb RAM (Kali: 8GB, Ubuntu Server: 1GB)
- 4 Cores (Kali: 2-4 Cores, Ubuntu Server: 1 Core)

### Attacker

*You can use anything you'd like*
[Kali Linux](https://kali.org)
- Clone the installation script [kali-setup.sh](https://github.com/Lavender-exe/ICS-Lab/blob/main/kali-setup.sh)
- `chmod +x kali-setup.sh`
- `./kali-setup.sh`

### Lab

[Ubuntu Server 23.04 ](https://ubuntu.com/download/server)
- Install the minimal setup to use less resources
- Clone the installation script [ics-setup.sh](https://github.com/Lavender-exe/ICS-Lab/blob/main/ics-setup.sh)
- `chmod +x ics-setup.sh`
- `./ics-setup.sh`

## Network

1. File -> Tools -> Network Manager -> NAT Networks
2. Right Click in the blank space and click create (or Ctrl + Shift + C)
3. Name it `ICSNetwork`
4. Use any subnet (I Used 192.168.10.0/24)
5. Enable DHCP

### Set Adapter

Do this for your offensive machine + lab server
1. Settings -> Network -> Adapter 2 -> NAT Network & Select ICSNetwork
2. Change Promiscuous Mode to Allow VMs
