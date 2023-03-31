#~/bin/bash

#Update package list and install them
apt get update && apt get upgrade -y

#Get required packages
apt install net-tools whois ldnsutils git libglib2.0-dev-bin ffmpeg baobab htop vlc eog traceroute evolution-ews gnome-shell-extension-manager chrome-gnome-shell gnome-tweaks tilix qt5-style-kvantum qt5-style-kvantum-themes 

#Enable UFW with default rules and allow SSH
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw reload 
ufw status numbered

#Add mozilla FF Repo
add-apt-repository ppa:mozillateam/ppa

snap remove firefox

#Let DPKG manage Firefox updates instead of snap
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

#install firefox .deb package
sudo apt update && sudo apt install firefox



#Create local icon and theme folders
mkdir /home/$USER/.icons
mkdir /home/$USER/.themes


#Set tilix terminal as system default, add tilix context menu button
sudo update-alternatives --config x-terminal-emulator
sudo apt install python3-nautilus
sudo apt remove nautilus-extension-gnome-terminal
killall nautilus

#Removes default terminal entry
mv /usr/share/applications/org.gnome.Terminal.desktop /usr/share/applications/org.gnome.Terminal.desktop_bak
