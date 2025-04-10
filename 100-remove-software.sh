#!/bin/bash
#set -e
##################################################################################################################
#tput setaf 0 = black 
#tput setaf 1 = red 
#tput setaf 2 = green
#tput setaf 3 = yellow 
#tput setaf 4 = dark blue 
#tput setaf 5 = purple
#tput setaf 6 = cyan 
#tput setaf 7 = gray 
#tput setaf 8 = light blue
##################################################################################################################

# Here we remove applications we do not want
echo
tput setaf 2
echo "################################################################"
echo "################### Software to remove"
echo "################################################################"
tput sgr0
echo

sudo systemctl disable tlp.service

sudo pacman -Rs tlp --noconfirm

sudo pacman -Rs broadcom-wl-dkms --noconfirm

sudo pacman -Rs r8168-dkms --noconfirm

sudo pacman -Rs xf86-video-amdgpu --noconfirm
sudo pacman -Rs xf86-video-fbdev --noconfirm
sudo pacman -Rs xf86-video-openchrome --noconfirm
sudo pacman -Rs xf86-video-vmware --noconfirm
sudo pacman -Rs xf86-video-ati --noconfirm
sudo pacman -Rs xf86-video-nouveau --noconfirm
sudo pacman -Rs xf86-video-vesa --noconfirm

sudo pacman -Rs mousepad --noconfirm
sudo pacman -Rs xfburn --noconfirm
sudo pacman -Rs xfce4-screenshooter --noconfirm
sudo pacman -Rs vim --noconfirm

echo
tput setaf 2
echo "################################################################"
echo "################### Software removed"
echo "################################################################"
tput sgr0
echo
