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

echo
tput setaf 2
echo "################################################################"
echo "################### Software to install"
echo "################################################################"
tput sgr0
echo

# here we assume we are on anything Arch Linux based - ArcoLinux as a rule

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software for anything Arch based"
echo "################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed insync
sudo pacman -S --noconfirm --needed libreoffice-fresh

sudo pacman -S --noconfirm --needed blender
sudo pacman -S --noconfirm --needed gimp
sudo pacman -S --noconfirm --needed inkscape
sudo pacman -S --noconfirm --needed krita
sudo pacman -S --noconfirm --needed ffmpeg
sudo pacman -S --noconfirm --needed imagemagick
sudo pacman -S --noconfirm --needed ventoy-bin
sudo pacman -S --noconfirm --needed calibre
sudo pacman -S --noconfirm --needed emby-theater
sudo pacman -S --noconfirm --needed handbrake
sudo pacman -S --noconfirm --needed makemkv
sudo pacman -S --noconfirm --needed mediainfo
sudo pacman -S --noconfirm --needed spotify
sudo pacman -S --noconfirm --needed gthumb
sudo pacman -S --noconfirm --needed gparted

paru -S --noconfirm davinci-resolve
paru -S --noconfirm youtube-dl 
paru -S --noconfirm mkv-extractor-qt

###############################################################################################

# when on Arch Linux

if grep -q "Arch Linux" /etc/os-release; then
  echo
  tput setaf 2
  echo "################################################################"
  echo "############### Installing software for Arch Linux - Any desktop"
  echo "################################################################"
  tput sgr0
  echo
  #sudo pacman -S --noconfirm --needed lsb-release

  # when on Xfce4

  if [ -f /usr/share/xsessions/xfce.desktop ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Installing software for Arch Linux - Xfce4"
    echo "################################################################"
    tput sgr0
    echo

 #   sudo pacman -S --noconfirm --needed arcolinux-local-xfce4-git
  fi

fi

echo
tput setaf 2
echo "################################################################"
echo "################### SKEL !!!"
echo "################################################################"
tput sgr0
echo

cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
cp -arf /etc/skel/. ~

echo
tput setaf 2
echo "################################################################"
echo "################### Software installed"
echo "################################################################"
tput sgr0
echo
