#!/bin/bash
#set -e
##################################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################################

if [ "$DEBUG" = true ]; then
    echo
    echo "------------------------------------------------------------"
    echo "Running $(basename $0)"
    echo "------------------------------------------------------------"
    echo
    read -n 1 -s -r -p "Debug mode is on. Press any key to continue..."
    echo
fi

##################################################################################################################################

echo
tput setaf 3
echo "########################################################################"
echo "################### cups"
echo "########################################################################"
tput sgr0
echo

func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 2
        echo "#######################################################################################"
        echo "################## The package "$1" is already installed"
        echo "#######################################################################################"
        echo
        tput sgr0
    else
        tput setaf 3
        echo "#######################################################################################"
        echo "##################  Installing package "  $1
        echo "#######################################################################################"
        echo
        tput sgr0
        sudo pacman -S --noconfirm --needed $1
    fi
}


installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

sudo pacman -S --noconfirm --needed cups
sudo pacman -S --noconfirm --needed cups-pdf
sudo pacman -S --noconfirm --needed ghostscript
sudo pacman -S --noconfirm --needed gsfonts
sudo pacman -S --noconfirm --needed gutenprint
sudo pacman -S --noconfirm --needed gtk3-print-backends
sudo pacman -S --noconfirm --needed libcups
sudo pacman -S --noconfirm --needed system-config-printer
sudo pacman -S --noconfirm --needed sane
sudo pacman -S --noconfirm --needed simple-scan

sudo systemctl enable --now cups.service

echo
tput setaf 6
echo "##############################################################"
echo "###################  $(basename $0) done"
echo "##############################################################"
tput sgr0
echo
