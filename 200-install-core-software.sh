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

sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed git

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

sudo pacman -S --noconfirm --needed nano
sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed bibata-cursor-theme-bin
sudo pacman -S --noconfirm --needed google-chrome
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed flameshot-git
sudo pacman -S --noconfirm --needed gitahead-bin
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed surfn-icons-git
sudo pacman -S --noconfirm --needed upd72020x-fw
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed wd719x-firmware
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet

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
  sudo pacman -S --noconfirm --needed alacritty
  sudo pacman -S --noconfirm --needed arcolinux-alacritty-git
  sudo pacman -S --noconfirm --needed archlinux-logout-git
  sudo pacman -S --noconfirm --needed arcolinux-paru-git
  sudo pacman -S --noconfirm --needed arcolinux-root-git
  sudo pacman -S --noconfirm --needed archlinux-system-config-git
  sudo pacman -S --noconfirm --needed lsb-release
  sudo pacman -S --noconfirm --needed archlinux-tweak-tool-git
  sudo pacman -S --noconfirm --needed arcolinux-variety-git
  sudo pacman -S --noconfirm --needed arcolinux-wallpapers-git
  sudo pacman -S --noconfirm --needed avahi
  sudo systemctl enable avahi-daemon.service
  sudo pacman -S --noconfirm --needed bat
  sudo pacman -S --noconfirm --needed dmenu
  sudo pacman -S --noconfirm --needed expac
  sudo pacman -S --noconfirm --needed feh
  sudo pacman -S --noconfirm --needed gvfs-smb
  sudo pacman -S --noconfirm --needed hardcode-fixer-git
  sudo pacman -S --noconfirm --needed hw-probe
  sudo pacman -S --noconfirm --needed man-db
  sudo pacman -S --noconfirm --needed man-pages  
  sudo pacman -S --noconfirm --needed meld
  sudo pacman -S --noconfirm --needed neofetch
  sudo pacman -S --noconfirm --needed nss-mdns
  sudo pacman -S --noconfirm --needed paru-bin
  sudo pacman -S --noconfirm --needed rate-mirrors-bin
  sudo pacman -S --noconfirm --needed ripgrep
  sudo pacman -S --noconfirm --needed variety
  sudo pacman -S --noconfirm --needed yay-bin
  
  sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
  sudo pacman -S --noconfirm --needed awesome-terminal-fonts
  sudo pacman -S --noconfirm --needed noto-fonts
  sudo pacman -S --noconfirm --needed ttf-bitstream-vera
  sudo pacman -S --noconfirm --needed ttf-dejavu
  sudo pacman -S --noconfirm --needed ttf-droid
  sudo pacman -S --noconfirm --needed ttf-hack
  sudo pacman -S --noconfirm --needed ttf-inconsolata
  sudo pacman -S --noconfirm --needed ttf-liberation
  sudo pacman -S --noconfirm --needed ttf-roboto
  sudo pacman -S --noconfirm --needed ttf-roboto-mono
  sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family

  echo
  echo "################################################################"
  echo "Getting latest /etc/nsswitch.conf from ArcoLinux"
  echo "################################################################"
  echo
  sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
  sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf

  # when on Xfce4

  if [ -f /usr/share/xsessions/xfce.desktop ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Installing software for Arch Linux - Xfce4"
    echo "################################################################"
    tput sgr0
    echo

    sudo pacman -S --noconfirm --needed arcolinux-local-xfce4-git
    sudo pacman -S --noconfirm --needed arcolinux-xfce-git
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
