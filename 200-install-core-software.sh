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

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software for anything Arch based"
echo "################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed arcolinux-root-git
sudo pacman -S --noconfirm --needed arcolinux-systemd-services-git ## from the guide
sudo pacman -S --noconfirm --needed arcoinstall-system-config-git ## from the guide
sudo pacman -S --noconfirm --needed arcoinstall-pacman-git ## from the guide
sudo pacman -S --noconfirm --needed archlinux-tweak-tool-git ## from the guide
sudo pacman -S --noconfirm --needed arcolinux-variety-autostart-git ## from the guide
sudo pacman -S --noconfirm --needed arcolinux-wallpapers-git ## from the guide


###############################################################################################

# when on Xfce4

  if [ -f /usr/share/xsessions/xfce.desktop ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Installing software for Arch Linux - Xfce4"
    echo "################################################################"
    tput sgr0
    echo

    #sudo pacman -S --noconfirm --needed arcolinux-local-xfce4-git
    sudo pacman -S --noconfirm --needed arconet-xfce ## from the guide
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
