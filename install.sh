#!/bin/bash
set -e 


read -p "Are you sure you want to procede? This script will most likely override many files on your system [y/n]" yn

if [ $yn != "y" ]; then
	echo "Aborting..."
	exit 0
fi
read -p "Your home directory (for example /home/johnsmith, notice there is no backslash at the end) : " homepath

if [ ! -d $homepath ]; then
	echo "Not a valid home directory. Aborting..."
	exit 0
fi

read -p "Are you sure $homepath is where you want to install this configuration? It may overwrite many files [y/n]
" yn

if [ $yn != "y" ]; then
	echo "Aborting..."
	exit 0
fi
echo "Initiating configuration installation..."

echo "Copying .xinitrc to $homepath"
cp configs/.xinitrc $homepath
echo ".xinitrc (X server configuration file) copied succesfully"

echo "Copying .alacritty.yml to $homepath"
cp configs/.alacritty.yml $homepath
echo ".alacritty.yml (Alacritty configuration file) copied succesfully!"

echo "Copying .bashrc to to $homepath"
cp configs/.bashrc $homepath
echo ".bashrc copied succesfully!"

echo "Copying .bash_profile to $homepath"
cp configs/.bash_profile $homepath
echo ".bash_profile copied succesfully!"

echo "Copying picom.conf to $homepath/.config"
cp configs/picom.conf $homepath
echo "picom.conf (X11/ compositor configuration file) copied succesfully!"

echo "Copying wallpaper.jpg to $homepath/Pictures"
if [ ! -d $homepath/Pictures ]; then
	mkdir $homepath/Pictures
	echo "Created directory $homepath/Pictures"
fi
cp pictures/wallpaper.jpg $homepath/Pictures
echo "wallpaper.jpg copied succesfully!"

echo "Copying config to $homepath/.config/i3"
if [ ! -d "$homepath/.config/i3" ]; then
	if [ ! -d "$homepath/.config" ]; then
		mkdir $homepath/.config
		echo "Created directory $homepath/.config"
	fi
	mkdir $homepath/.config/i3
	echo "Created directory $homepath/.config/i3"
fi
cp configs/config $homepath/.config/i3
echo "config (i3 configuration file) copied succesfully!"
cp configs/config $homepath/.config/i3

echo "Copying i3status.conf to $homepath/.congih/i3status"
cp configs/i3status.conf  $homepath/.config
echo "i3status/config (i3bar configuration file) copied succesfully!"

read -p "Do you want to modify your grub config? [y/n]" yn

if [ $yn == "y" ]; then
echo "Copying grub to /etc/default/grub"
sudo cp configs/grub /etc/default/grub
echo "grub (grub configuration file) copied succesfully!"
echo "Updating grub..."
sudo update-grub
echo "Grub updated succesfully!"
else 
echo "Skipping...";
fi

echo "Installation completed succesfully!"
exit 0
