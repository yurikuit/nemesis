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
cd $HOME"/DATA"
git clone https://github.com/arcolinux/arcolinux-spices
sudo ./usr/share/arcolinux-spices/scripts/get-the-keys-and-repos.sh
sudo pacman -Sy

echo
tput setaf 2
echo "################################################################"
echo "################### Installing software for anything Arch based"
echo "################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed upd72020x-fw
sudo pacman -S --noconfirm --needed wd719x-firmware

sudo pacman -S --noconfirm --needed nano ## from the guide
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed bash-completion ## from the guide
sudo pacman -S --noconfirm --needed networkmanager
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed meld ## from the guide
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed pamac ## from the guide
sudo pacman -S --noconfirm --needed btop ## from the guide
sudo pacman -S --noconfirm --needed htop ## from the guide
sudo pacman -S --noconfirm --needed arandr ## from the guide
sudo pacman -S --noconfirm --needed lsb-release
sudo pacman -S --noconfirm --needed bat ## from the guide
sudo pacman -S --noconfirm --needed dmenu ## from the guide
sudo pacman -S --noconfirm --needed expac ## from the guide
sudo pacman -S --noconfirm --needed feh ## from the guide
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed hw-probe
sudo pacman -S --noconfirm --needed man-db ## from the guide
sudo pacman -S --noconfirm --needed man-pages ## from the guide
sudo pacman -S --noconfirm --needed meld ## from the guide
sudo pacman -S --noconfirm --needed neofetch ## from the guide
sudo pacman -S --noconfirm --needed nss-mdns
sudo pacman -S --noconfirm --needed paru-git ## from the guide
sudo pacman -S --noconfirm --needed rate-mirrors-bin
sudo pacman -S --noconfirm --needed ripgrep ## from the guide
sudo pacman -S --noconfirm --needed yay-git ## from the guide
sudo pacman -S --noconfirm --needed alacritty ## from the guide

sudo pacman -S --noconfirm --needed arc-gtk-theme ## from the guide
sudo pacman -S --noconfirm --needed bibata-cursor-theme-bin ## from the guide
sudo pacman -S --noconfirm --needed surfn-icons-git ## from the guide
sudo pacman -S --noconfirm --needed arconet-wallpapers ## from the guide
sudo pacman -S --noconfirm --needed sparklines-git ## from the guide

sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed ttf-bitstream-vera
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed ttf-hack ## from the guide
sudo pacman -S --noconfirm --needed ttf-inconsolata
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-roboto
sudo pacman -S --noconfirm --needed ttf-roboto-mono
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family

sudo pacman -S --noconfirm --needed google-chrome
sudo pacman -S --noconfirm --needed firefox ## from the guide
sudo pacman -S --noconfirm --needed flameshot-git
sudo pacman -S --noconfirm --needed gitahead-git ## from the guide
sudo pacman -S --noconfirm --needed sublime-text-4 ## from the guide
sudo pacman -S --noconfirm --needed vlc ## from the guide
sudo pacman -S --noconfirm --needed variety ## from the guide

sudo pacman -S --noconfirm --needed arcolinux-alacritty-git ## from the guide
sudo pacman -S --noconfirm --needed archlinux-logout-git ## from the guide
sudo pacman -S --noconfirm --needed arcolinux-paru-git
sudo pacman -S --noconfirm --needed arcolinux-root-git
sudo pacman -S --noconfirm --needed arcolinux-systemd-services-git ## from the guide
sudo pacman -S --noconfirm --needed arcoinstall-system-config-git ## from the guide
sudo pacman -S --noconfirm --needed arcoinstall-pacman-git ## from the guide
sudo pacman -S --noconfirm --needed archlinux-tweak-tool-git ## from the guide
sudo pacman -S --noconfirm --needed arconet-variety-config ## from the guide
sudo pacman -S --noconfirm --needed arcolinux-variety-autostart-git ## from the guide
sudo pacman -S --noconfirm --needed arcolinux-wallpapers-git ## from the guide

sudo pacman -S --noconfirm --needed avahi
sudo systemctl enable avahi-daemon.service

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
