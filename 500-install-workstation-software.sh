#!/bin/bash
#set -e
##################################################################################################################
# Author 	: Erik Dubois
# Website : https://www.erikdubois.be
# Website : https://www.alci.online
# Website	: https://www.arcolinux.info
# Website	: https://www.arcolinux.com
# Website	: https://www.arcolinuxd.com
# Website	: https://www.arcolinuxb.com
# Website	: https://www.arcolinuxiso.com
# Website	: https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
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

if grep -q arcolinux_repo /etc/pacman.conf; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################ ArcoLinux repos are already in /etc/pacman.conf"
  echo "################################################################"
  tput sgr0
  echo
  else
  #get the keys and mirrors for ArcoLinux
  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Getting the keys and mirrors for ArcoLinux"
  echo "################################################################"
  tput sgr0
  echo
  sh arch/get-the-keys-and-repos.sh
  sudo pacman -Sy
fi

# when on Carli - remove conflicting files 

if [ -f /usr/local/bin/get-nemesis-on-carli ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Removing software from Carli"
  echo "################################################################"
  tput sgr0
  echo
  #sudo pacman -R --noconfirm carli-xfce-config
  fi

# when on AA - remove conflicting files 

if [ -f /usr/local/bin/get-nemesis-on-alci ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Removing software from AA"
  echo "################################################################"
  tput sgr0
  echo
  sudo rm /etc/skel/.Xresources
  #sudo pacman -R --noconfirm grml-zsh-config
fi

# here we assume we are on anything Arch Linux based - ArcoLinux as a rule

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software for anything Arch based"
echo "################################################################"
tput sgr0
echo

#sudo pacman -S --noconfirm --needed google-chrome
sudo pacman -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed gitahead-bin
sudo pacman -S --noconfirm --needed gitfiend
#sudo pacman -S --noconfirm --needed insync
#sudo pacman -S --noconfirm --needed nomacs
#sudo pacman -S --noconfirm --needed pv
#sudo pacman -S --noconfirm --needed simplescreenrecorder
sudo pacman -S --noconfirm --needed telegram-desktop
#sudo pacman -S --noconfirm --needed the_platinum_searcher-bin
sudo pacman -S --noconfirm --needed ttf-wps-fonts
sudo pacman -S --noconfirm --needed libreoffice-fresh

sudo pacman -S --noconfirm --needed oh-my-zsh-git
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed zsh-completions
sudo pacman -S --noconfirm --needed zsh-syntax-highlighting

sudo pacman -S --noconfirm --needed blender
sudo pacman -S --noconfirm --needed gimp
sudo pacman -S --noconfirm --needed inkscape
sudo pacman -S --noconfirm --needed krita
sudo pacman -S --noconfirm --needed ffmpeg
sudo pacman -S --noconfirm --needed imagemagick
sudo pacman -S --noconfirm --needed ventoy-bin
sudo pacman -S --noconfirm --needed zsh-completions-git
sudo pacman -S --noconfirm --needed calibre
sudo pacman -S --noconfirm --needed rxvt-unicode
sudo pacman -S --noconfirm --needed remmina
sudo pacman -S --noconfirm --needed whatsapp-nativefier
sudo pacman -S --noconfirm --needed emby-theater
sudo pacman -S --noconfirm --needed handbrake
sudo pacman -S --noconfirm --needed makemkv
sudo pacman -S --noconfirm --needed mediainfo
sudo pacman -S --noconfirm --needed spotify
sudo pacman -S --noconfirm --needed evolution
#sudo pacman -S --noconfirm --needed gthumb
sudo pacman -S --noconfirm --needed gparted

paru -S --noconfirm davinci-resolve
paru -S --noconfirm youtube-dl 
paru -S --noconfirm mkv-extractor-qt
paru -S --noconfirm tsmuxer-git

###############################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software from nemesis_repo"
echo "################################################################"
tput sgr0
echo  

#sudo pacman -S --noconfirm --needed edu-candy-beauty-arc-git

###############################################################################################

# when on Leftwm

if [ -f /usr/share/xsessions/leftwm.desktop ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Leftwm related applications"
  echo "################################################################"
  tput sgr0
  echo


  #sh ~/.config/leftwm/scripts/install-all-arcolinux-themes.sh
  
fi

###############################################################################################

# when on Plasma

if [ -f /usr/bin/startplasma-x11 ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Plasma related applications"
  echo "################################################################"
  tput sgr0
  echo

  #sudo pacman -S --noconfirm --needed arcolinux-plasma-nordic-darker-candy-git
fi

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

  echo
  echo "################################################################"
  echo "Getting latest /etc/nsswitch.conf from ArcoLinux"
  echo "################################################################"
  echo
#  sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
#  sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf

  # when on Plasma

  if [ -f /usr/bin/startplasma-x11 ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Installing software for Arch Linux - Plasma"
    echo "################################################################"
    tput sgr0
    echo    
#    sudo pacman -S --noconfirm --needed arcolinux-plasma-nordic-darker-candy-git
 
  fi

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

  # when on i3

  if [ -f /usr/share/xsessions/i3.desktop ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Installing software for Arch Linux - i3wm"
    echo "################################################################"
    tput sgr0
    echo

 #   sudo pacman -S --noconfirm --needed arcolinux-i3wm-git
 
  fi

  # when on Cinnamon

  if [ -f /usr/bin/cinnamon ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Cinnamon related applications"
    echo "################################################################"
    tput sgr0
    echo

 #   sudo pacman -S --noconfirm --needed cinnamon-translations
 
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
