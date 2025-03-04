#!/bin/bash
#set -e
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

if [ -f /usr/local/bin/get-nemesis-on-arch ]; then

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### We are on an ARCH LINUX BASED iso"
	echo "################################################################"
	tput sgr0
	echo

	if [ -f /usr/share/xsessions/xfce.desktop ]; then
		echo
		tput setaf 2
		echo "################################################################"
		echo "################### We are on Xfce4"
		echo "################################################################"
		tput sgr0
		echo
		echo "Changing the whiskermenu"
		echo
		cp $installed_dir/settings/archlinux/whiskermenu-7.rc ~/.config/xfce4/panel/whiskermenu-7.rc

		echo
		echo "Changing sddm theme"
		echo
		sudo pacman -S --noconfirm --needed arcolinux-sddm-simplicity-git
		FIND="Current=breeze"
		REPLACE="Current=arcolinux-simplicity"
		sudo sed -i "s/$FIND/$REPLACE/g" /etc/sddm.conf

	fi	

fi