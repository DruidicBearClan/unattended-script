#~/bin/bash
# init
function pause(){
   read -p "$*"
}

pause 'This script assumes that you have a new ubuntu install or that you at least have read some of what the script does. Press any key to confirm that, or cancel with Ctrl-C'

echo updating regular packages
apt get update && apt get upgrade -y

echo Installing the essential net-tools and media
apt install net-tools openssh whois ldnsutils ffmpeg traceroute nmap -y

echo installing required libraries and older themes for non-gtk3 apps
apt install qt5-style-kvantum qt5-style-kvantum-themes libssl-dev libssh-dev libidn11-dev libpcre3-dev -y

echo installing some essential software
apt install baobab rlwrap ufw htop vim git vlc eog evolution-ews gnome-shell-extension-manager chrome-gnome-shell gnome-tweaks tilix -y

echo installing Ubuntu-repo included security tools for which the release version is not an issue
apt install proxychains hashcat gpg pgpgpg tor proxychains default-mysql-client libimage-exiftool-perl -y

echo enabling UFW firewall with default deny rules
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw reload

echo creating multiple folders in home directory
mkdir /home/$USER/.icons /home/$USER/.themes /home/$USER/Apps /home/$USER/Tools /home/$USER/Dev

echo Now select tilix terminal from the options and confirm the choice with ENTER

update-alternatives --config x-terminal-emulator
apt install python3-nautilus
apt remove nautilus-extension-gnome-terminal
killall nautilus
mv /usr/share/applications/org.gnome.Terminal.desktop /usr/share/applications/org.gnome.Terminal.desktop_bak
