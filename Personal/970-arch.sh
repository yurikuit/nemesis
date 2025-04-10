#!/bin/bash
#set -e
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

echo
tput setaf 2
echo "################################################################"
echo "################### We are on an ARCH LINUX BASED iso"
echo "################################################################"
tput sgr0
echo

echo
echo "Copying /etc/environment"
echo
sudo cp -vf $installed_dir/settings/environment/environment /etc/environment
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

fi
