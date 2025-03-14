#!/bin/bash

# تعریف رنگ‌ها
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"
red='\e[1;31m'
default='\e[0m'
yellow='\e[0;33m'
orange='\e[38;5;166m'
green='\033[92m'

# پاک کردن صفحه و تاخیر
clear
sleep 1.5
echo -e "$default"

# نصب software-properties-common برای add-apt-repository
echo -e "${yellow}Installing software-properties-common...${default}"
apt install software-properties-common -y || { echo -e "${red}Error installing software-properties-common${default}"; exit 1; }

# اضافه کردن مخزن قدیمی اوبونتو (focal)
echo -e "${yellow}Adding old repository...${default}"
add-apt-repository "deb http://archive.ubuntu.com/ubuntu/ focal main universe" -y || { echo -e "${red}Error adding repository${default}"; exit 1; }
apt update || { echo -e "${red}Error updating package list${default}"; exit 1; }

# نصب پایتون 2
echo -e "${yellow}Installing Python 2...${default}"
apt install python2 -y || { echo -e "${red}Error installing python2${default}"; exit 1; }
python2 --version && echo -e "${green}Python 2 installed successfully${default}" || echo -e "${red}Python 2 installation failed${default}"

# نصب pip برای پایتون 2
echo -e "${yellow}Installing pip for Python 2...${default}"
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py || { echo -e "${red}Error downloading get-pip.py${default}"; exit 1; }
python2 get-pip.py || { echo -e "${red}Error installing pip2${default}"; exit 1; }
pip2 --version && echo -e "${green}pip2 installed successfully${default}" || echo -e "${red}pip2 installation failed${default}"

# نصب پکیج requests
echo -e "${yellow}Installing requests with pip2...${default}"
pip2 install requests || { echo -e "${red}Error installing requests${default}"; exit 1; }
echo -e "${green}requests installed successfully${default}"

# رفتن به دایرکتوری و اجرای اسکریپت
echo -e "${yellow}Navigating to AllHackingTools and running InstallMenu.py...${default}"
cd ~/AllHackingTools || { echo -e "${red}Error navigating to AllHackingTools${default}"; exit 1; }
python2 src/InstallMenu.py || { echo -e "${red}Error running InstallMenu.py${default}"; exit 1; }
echo -e "${green}Script executed successfully${default}"
