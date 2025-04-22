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
echo "##############################################################"
echo "################### Start of the removal process"
echo "##############################################################"
tput sgr0
echo

echo
tput setaf 3
echo "##############################################################"
echo "################### Move configs for all - backup"
echo "##############################################################"
tput sgr0
echo

# always put the current .bashrc .zshrc away
if [ -f /etc/skel/.bashrc ]; then
  sudo mv -v /etc/skel/.bashrc /etc/skel/.bashrc-nemesis
fi

if [ -f /etc/skel/.zshrc ]; then
  sudo mv -v /etc/skel/.zshrc /etc/skel/.zshrc-nemesis
fi

echo
tput setaf 3
echo "########################################################################"
echo "######## Removing the driver for xf86-video-vmware if possible"
echo "########################################################################"
tput sgr0
echo

if ! systemd-detect-virt | grep -q "oracle"; then
  if pacman -Qi xf86-video-vmware &> /dev/null; then
    sudo pacman -Rs xf86-video-vmware --noconfirm
  fi
fi

# when on any ArcoLinux ISO


if [[ -f /etc/dev-rel ]]; then
  echo
  tput setaf 3
  echo "##############################################################"
  echo "####### Removing software on ArcoLinux ISOs"
  echo "##############################################################"
  tput sgr0
  echo

  echo
  tput setaf 3
  echo "########################################################################"
  echo "######## Launch of get-me-started - kernels - conkys - broadcom/realtek"
  echo "########################################################################"
  tput sgr0
  echo

  
  tput setaf 1;
  echo "###############################################################################"
  echo "###      SCRIPT TO REMOVE ELEMENTS WITH NO QUESTIONS ASKED"
  echo "###"
  echo "###      - KEEP LINUX KERNEL GET RID OF THE OTHER KERNELS"
  echo "###      - GET RID OF BROADCOM AND REALTEK DRIVERS"
  echo "###      - GET RID OF CONKYS"
  echo "###############################################################################"
  tput sgr0
  
  #######broadcom and realtek
  
  sudo pacman -Rs broadcom-wl-dkms r8168-dkms rtl8821cu-morrownr-dkms-git --noconfirm
  
  # Ensure at least one kernel remains
  if pacman -Qi linux &> /dev/null && pacman -Qi linux-headers &> /dev/null; then
  
  
      # Define all the kernels and their headers you want to remove
      KERNELS_TO_REMOVE=(
           linux-lts-headers linux-lts
           linux-zen-headers linux-zen
           linux-hardened-headers linux-hardened
           linux-rt-headers linux-rt
           linux-rt-lts-headers linux-rt-lts
           linux-cachyos-headers linux-cachyos
           linux-xanmod-headers linux-xanmod
      )
      remove_package() {
          local package=$1
          # Check if the package is installed
          if pacman -Q $package &> /dev/null; then
              echo "$package is installed. Removing..."
              sudo pacman -Rns --noconfirm $package
          else
              echo "$package is not installed."
          fi
      }
  
      # Loop over the array and remove each kernel package
      for kernel in "${KERNELS_TO_REMOVE[@]}"; do
          remove_package "$kernel"
      done
  
  else
      echo "Cannot proceed: At least one kernel must remain installed."
  fi
  
  #######conkys
  
  # Array of packages to check
  packages=("conky-lua-archers" "arcolinux-conky-collection-git" "arcolinux-conky-collection-plasma-git")  
  
  # Function to check if a package is installed
  is_package_installed() {
      if pacman -Q "$1" &> /dev/null; then
          echo "Package $1 is installed."
          return 0  # Success
      else
          echo "Package $1 is not installed."
          return 1  # Failure
      fi
  }
  
  # Iterate over each package in the array
  for package in "${packages[@]}"; do
      if is_package_installed "$package"; then
          echo "Removing $package..."
          sudo pacman -Rns "$package" --noconfirm
      else
          echo "$package is not installed, no need to remove."
      fi
      echo
      echo "########################"
      echo "Double checking $package"
      echo "########################"
      echo
      if ! is_package_installed "$package"; then
          echo "$package is not installed!"
      else
          echo "$package is still installed. Check manually why not."
      fi
  done

  # order is important - dependencies
  
  echo
  tput setaf 3
  echo "########################################################################"
  echo "######## Removing the Arch Linux Tweak Tool"
  echo "######## Removing arcolinux-keyring"
  echo "######## Removing arcolinux-mirrorlist-git"
  echo "########################################################################"
  tput sgr0
  echo

  sudo pacman -Rns --noconfirm archlinux-tweak-tool-git

  sudo pacman -Rs --noconfirm arcolinux-keyring
  sudo pacman -Rs --noconfirm arcolinux-mirrorlist-git

  echo
  tput setaf 3
  echo "########################################################################"
  echo "######## Removing ArcoLinux packages"
  echo "########################################################################"
  tput sgr0
  echo

  sudo pacman -Rs --noconfirm arcolinux-pipemenus-git

  sudo pacman -Rs --noconfirm a-candy-beauty-icon-theme-git
  sudo pacman -Rs --noconfirm adobe-source-han-sans-cn-fonts
  sudo pacman -Rs --noconfirm adobe-source-han-sans-jp-fonts
  sudo pacman -Rs --noconfirm adobe-source-han-sans-kr-fonts
  sudo pacman -Rs --noconfirm archlinux-kernel-manager
  sudo pacman -Rs --noconfirm arcolinux-app-glade-git
  sudo pacman -Rs --noconfirm arcolinux-arc-dawn-git
  sudo pacman -Rs --noconfirm arcolinux-arc-kde
  sudo pacman -Rs --noconfirm arcolinux-dconf-all-desktops-git
  sudo pacman -Rs --noconfirm arcolinux-desktop-trasher-git
  sudo pacman -Rs --noconfirm arcolinux-faces-git
  sudo pacman -Rs --noconfirm arcolinux-fish-git
  sudo pacman -Rs --noconfirm arcolinux-fonts-git
  sudo pacman -Rs --noconfirm arcolinux-hblock-git
  sudo pacman -Rs --noconfirm arcolinux-kvantum-git
  sudo pacman -Rs --noconfirm arcolinux-local-applications-all-hide-git
  sudo pacman -Rs --noconfirm arcolinux-local-applications-git
  sudo pacman -Rs --noconfirm arcolinux-local-xfce4-git
  sudo pacman -Rs --noconfirm arcolinux-logo-git
  sudo pacman -Rs --noconfirm arcolinux-meta-log
  sudo pacman -Rs --noconfirm arcolinux-root-git
  sudo pacman -Rs --noconfirm arcolinux-sddm-simplicity-git
  sudo pacman -Rs --noconfirm arcolinux-systemd-services-git
  sudo pacman -Rs --noconfirm arcolinux-wallpapers-git
  sudo pacman -Rs --noconfirm arcolinux-welcome-app-git
  sudo pacman -Rs --noconfirm arcolinux-xfce-panel-profiles-git
  sudo pacman -Rs --noconfirm arcolinux-zsh-git
  sudo pacman -Rs --noconfirm arconet-variety-config
  sudo pacman -Rs --noconfirm arconet-wallpapers
  sudo pacman -Rs --noconfirm arconet-xfce
  sudo pacman -Rs --noconfirm sofirem-git

  if [ -f /usr/share/wayland-sessions/plasma.desktop ]; then
    sudo pacman -Rs --noconfirm arcolinux-plasma-keybindings-git
    sudo pacman -Rs --noconfirm arcolinux-plasma-servicemenus-git
    sudo pacman -Rs --noconfirm arcolinux-plasma-theme-candy-beauty-arc-dark-git
    sudo pacman -Rs --noconfirm arcolinux-plasma-theme-candy-beauty-nordic-git
    sudo pacman -Rs --noconfirm arcolinux-gtk-surfn-plasma-dark-git
  fi

  echo
  tput setaf 3
  echo "########################################################################"
  echo "######## Removing 3th party packages on ArcoLinux"
  echo "########################################################################"
  tput sgr0
  echo

  sudo pacman -Rs --noconfirm bibata-cursor-theme-bin
  sudo pacman -Rs --noconfirm fastfetch
  sudo pacman -Rs --noconfirm mintstick-git
  sudo pacman -Rs --noconfirm nomacs-qt6-git
  sudo pacman -Rs --noconfirm rate-mirrors-bin
  sudo pacman -Rs --noconfirm xfce4-artwork

  tput setaf 3
  echo "##############################################################"
  echo "################### Software removal for ArcoLinux done"
  echo "##############################################################"
  tput sgr0
  echo

fi

# when on Arch Linux - remove conflicting files
if grep -q "Arch Linux" /etc/os-release && [ ! -e /bootloader ]; then

  echo
  tput setaf 2
  echo "##############################################################"
  echo "############### Removing software for Arch"
  echo "##############################################################"
  tput sgr0
  echo

  echo
  tput setaf 3
  echo "########################################################################"
  echo "######## Removing the drivers"
  echo "########################################################################"
  tput sgr0
  echo

  sudo pacman -Rs --noconfirm xf86-video-amdgpu --noconfirm
  sudo pacman -Rs --noconfirm xf86-video-ati --noconfirm
  sudo pacman -Rs --noconfirm xf86-video-fbdev --noconfirm
  sudo pacman -Rs --noconfirm xf86-video-nouveau --noconfirm
  sudo pacman -Rs --noconfirm xf86-video-openchrome --noconfirm
  sudo pacman -Rs --noconfirm xf86-video-vesa --noconfirm

  # sudo pacman -Rs --noconfirm archinstall
  # sudo pacman -Rs --noconfirm hardinfo-gtk3
  # sudo pacman -Rs --noconfirm lftp
  # sudo pacman -Rs --noconfirm memtest86+
  # sudo pacman -Rs --noconfirm memtest86+-efi

  sudo systemctl disable tlp.service
  sudo pacman -Rs tlp --noconfirm

  sudo pacman -Rs mousepad --noconfirm
  sudo pacman -Rs xfburn --noconfirm
  sudo pacman -Rs xfce4-screenshooter --noconfirm
  sudo pacman -Rs vim vim-runtime --noconfirm

  echo
  tput setaf 2
  echo "##############################################################"
  echo "################### Software on Arch removed"
  echo "##############################################################"
  tput sgr0
  echo

fi

echo
tput setaf 6
echo "##############################################################"
echo "###################  $(basename $0) done"
echo "##############################################################"
tput sgr0
echo
