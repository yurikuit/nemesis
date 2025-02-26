#!/bin/bash
#set -e
##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Bookmarks to install"
echo "################################################################"
tput sgr0
echo
installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

[ -d $HOME"/.config/gtk-3.0" ] || mkdir -p $HOME"/.config/gtk-3.0"
cp $installed_dir/settings/bookmarks/bookmarks* ~/.config/gtk-3.0/

echo
tput setaf 2
echo "################################################################"
echo "################### Bookmarks installed"
echo "################################################################"
tput sgr0
echo