#~/bin/bash

#Regular ubuntu mirrorlist update and upgrade all apps
apt get update && apt get upgrade -y

#Installing the essential net-tools and media
apt install net-tools openssh whois ldnsutils ffmpeg traceroute nmap -y

#installing required libraries and older themes for non-gtk3 apps
apt install qt5-style-kvantum qt5-style-kvantum-themes libssl-dev libssh-dev libidn11-dev libpcre3-dev -y

#Installing essential applications
apt install baobab rlwrap ufw htop vim git vlc eog evolution-ews gnome-shell-extension-manager chrome-gnome-shell gnome-tweaks tilix -y

#Install security tools included in default ubuntu mirrors (where held version is no concern)
apt install proxychains hashcat gpg pgpgpg tor proxychains default-mysql-client libimage-exiftool-perl

#Enable a simple local firewall with a default deny policy
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw reload
ufw status numbered

#Create some extra folders in home directory
mkdir /home/$USER/.icons /home/$USER/.themes /home/$USER/Apps /home/$USER/Tools /home/$USER/Dev

echo select the number for option tilix terminal as default and confirm the choice

#Sets tilix application as the default terminal, adds tilix as context-menu option, remove ubuntu terminal as option
update-alternatives --config x-terminal-emulator
apt install python3-nautilus
apt remove nautilus-extension-gnome-terminal
killall nautilus
mv /usr/share/applications/org.gnome.Terminal.desktop /usr/share/applications/org.gnome.Terminal.desktop_bak
