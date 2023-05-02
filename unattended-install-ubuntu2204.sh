#~/bin/bash

#functions

function pause(){
   read -p "$*"
}

#init

#motd
pause 'This script assumes that you have a new ubuntu install or that you at least have read some of what the script does. 
Press any key to confirm that, or cancel with Ctrl-C. I recommend the Ubuntu desktop minimal install for this script.'

#updating and installing
echo updating regular packages
apt get update && apt get upgrade -y

echo Installing the essential net-tools and media
apt install net-tools openssh whois ldnsutils ffmpeg traceroute nmap -y

echo installing required libraries and older themes for non-gtk3 apps
apt install qt5-style-kvantum qt5-style-kvantum-themes libssl-dev libssh-dev libidn11-dev libpcre3-dev -y

echo installing some essential software
apt install baobab rlwrap ufw htop vim git vlc eog evolution-ews gnome-shell-extension-manager chrome-gnome-shell gnome-tweaks tilix -y

echo installing Ubuntu-repos included security tools, for which the release version is not an issue
apt install proxychains hashcat gpg pgpgpg tor default-mysql-client libimage-exiftool-perl -y

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
