#!/bin/bash

#functions

function pause(){
   read -p "$*"
}

#init

#warn
pause 'This script assumes that you have a new Ubuntu install. This script will do a lot of stuff, read the code.
Press any key to confirm, or cancel with Ctrl-C. Tested on Ubuntu Desktop 22.04 minimal version'

#updating and installing
sleep 5 updating regular packages
apt get update && apt get upgrade -y

sleep 5 Installing the essential net-tools and media
apt install net-tools openssh whois ldnsutils ffmpeg traceroute nmap -y

echo installing required libraries and older themes for non-gtk3 apps
apt install qt5-style-kvantum qt5-style-kvantum-themes libssl-dev libssh-dev libidn11-dev libpcre3-dev -y

echo installing some essential software
apt install baobab rlwrap ufw htop vim git vlc eog evolution-ews gnome-shell-extension-manager chrome-gnome-shell gnome-tweaks tilix -y

echo installing the security packages for which the release version is not an issue, grabbing those from default Ubuntu repo.
apt install proxychains slapd ssdeep ldap-utils wireshark meld hashcat gpg pgpgpg sqlitebrowser tor default-mysql-client libimage-exiftool-perl -y

systemctl enable slapd

#installing uncomplicated fire wall
echo enabling UFW firewall with default deny rules
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw reload

#creating some often used folders
echo creating multiple folders in home directory
mkdir /home/$USER/.icons /home/$USER/.themes /home/$USER/Apps /home/$USER/Tools /home/$USER/Dev

#configuring tilix default terminal application and fixing context menu
echo Now select tilix terminal from the options and confirm the choice with ENTER

update-alternatives --config x-terminal-emulator
apt install python3-nautilus
apt remove nautilus-extension-gnome-terminal
killall nautilus
mv /usr/share/applications/org.gnome.Terminal.desktop /usr/share/applications/org.gnome.Terminal.desktop_bak

#disable Wayland, enable X11
echo Disabling Wayland, enabling X11
sed 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm3/custom.conf

#creating a default 4GB swap partition
echo Creating 4GB swap file
swapoff -a
dd if=/dev/zero of=/swapfile bs=1M count=4096
mkswap /swapfile
swapon /swapfile
free -m

#installing nvidia graphics drivers when available
echo installing Nvidia GPU drivers
lshw -c display
ubuntu-drivers autoinstall

echo A reboot of the system is now required