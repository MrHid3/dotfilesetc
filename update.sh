#!/bin/bash
set -e

read -p "This script will update the config files of this repo based on the ones present on your computer. Are you sure you want to continue? [y/n]" yn

if [ $yn != "y" ]; then
echo "Aborting..."
exit 0
fi

read -p "Please specify your home directory (for example /home/johnsmith, please notice there is no backslash at the end) : " home

if [ ! -d $home ]; then
echo "This directory does not exist, aborting..."
exit 0
fi

if [ ! -f $home/.xinitrc ]; then
echo ".xinitrc not found, aborting..."
exit 0
fi
echo ".xinitrc found!"

if [ ! -f $home/.bashrc ]; then
echo ".bashrc not found, aborting..."
exit 0
fi
echo ".bashrc found!"

if [ ! -f $home/.bash_profile ]; then
echo ".bash_profile not found, aborting..."
exit 0
fi
echo ".bash_profile found!"

if [ ! -f $home/.alacritty.yml ]; then
echo ".alacritty.yml not found, aborting..."
exit 0
fi
echo ".alacritty.yml found!"

if [ ! -f $home/.config/picom.conf ]; then
echo ".config/picom.conf not found, aborting..."
exit 0
fi
echo ".config/picom.conf found!"

if [ ! -f $home/.i3status.conf ]; then
echo ".i3status.conf not found, aborting..."
exit 0
fi
echo ".i3status.conf found!"

if [ ! -f $home/.config/i3/config ]; then
echo ".config/i3/config not found, aborting..."
exit 0
fi
echo ".config/i3/config found!"

if [ ! -f $home/.i3blocks.conf ]; then
echo ".i3blocks.conf not found, aborting..."
exit 0
fi
echo ".i3blocks.conf found!"

read -p "Do you wish to also update the grub config [y/n]?" grubyn
if [ $grubyn == "y" ]; then
if [ ! -f /etc/default/grub ]; then
echo "/etc/default/grub not found, aborting..."
exit 0
else
echo "/etc/default/grub found!"
fi
else
echo "Skipping..."
fi

cp $home/.xinitrc configs/
echo ".xinitrc copied succesfully!"
cp $home/.bashrc configs/
echo ".bashrc copied succesfully!"
cp $home/.bash_profile configs/
echo ".bash_profile copied succesfully!"
cp $home/.alacritty.yml configs/
echo ".alacritty.yml copied succesfully!"
cp $home/.config/picom.conf configs/
echo ".config/picom.conf copied succesfully!"
cp $home/.i3status.conf configs/
echo ".config/i3status.conf copied succesfully!"
cp $home/.config/i3/config configs/
echo ".config/i3/config copied succesfully!"
cp $home/.i3blocks.conf configs/
echo ".i3blocks.conf copied succesfully!"
if [ $grubyn == "y" ]; then
sudo cp /etc/default/grub configs/
else
echo "Skipping grub..."
fi

echo "Configs updated succesfully!"
exit 0
