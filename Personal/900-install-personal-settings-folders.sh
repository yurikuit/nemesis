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

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

echo
tput setaf 2
echo "################################################################"
echo "################### Personal settings to install"
echo "################################################################"
tput sgr0
echo
echo "Creating folders we use later"
echo
[ -d $HOME"/.bin" ] || mkdir -p $HOME"/.bin"
[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"
[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/.local/share/icons" ] || mkdir -p $HOME"/.local/share/icons"
[ -d $HOME"/.local/share/themes" ] || mkdir -p $HOME"/.local/share/themes"
[ -d "/personal" ] || sudo mkdir -p "/personal"
[ -d $HOME"/.config" ] || mkdir -p $HOME"/.config"
[ -d $HOME"/.config/fish" ] || mkdir -p $HOME"/.config/fish"
[ -d $HOME"/DATA" ] || mkdir -p $HOME"/DATA"
[ -d $HOME"/Insync" ] || mkdir -p $HOME"/Insync"
echo
echo "Installing all shell files"
echo
cp $installed_dir/settings/shell-personal/.bashrc-personal ~
cp $installed_dir/settings/fish/alias.fish ~/.config/fish/alias.fish
echo
echo "Installing personal settings of variety"
echo
[ -d $HOME"/.config/variety" ] || mkdir -p $HOME"/.config/variety"
#cp $installed_dir/settings/variety/variety.conf ~/.config/variety/
cp -R $installed_dir/settings/variety ~/.config/
echo
echo "Adding personal looks to /personal"
echo
sudo cp -arf ../Personal-iso/personal-iso/* /personal
echo
echo "Adding personal thunar to .config/thunar"
echo
[ -d $HOME"/.config/Thunar" ] || mkdir -p $HOME"/.config/Thunar"
cp  settings/thunar/uca.xml $HOME/.config/Thunar
echo

#adding desktop icons
if [ -f $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml" ]; then

  echo
  echo "Setting desktop icons"
  echo
  FIND="false"
  REPLACE="true"
  SEARCH="show-home"
    sudo sed -i "/$SEARCH/s/$FIND/$REPLACE/g" $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"

  SEARCH="show-filesystem"
    sudo sed -i "s/$FIND/$REPLACE/g" $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"

  SEARCH="show-trash"
    sudo sed -i "s/$FIND/$REPLACE/g" $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"

  SEARCH="show-removable"
    sudo sed -i "s/$FIND/$REPLACE/g" $HOME"/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml"    

fi

echo
tput setaf 2
echo "################################################################"
echo "################### Personal settings installed"
echo "################################################################"
tput sgr0
echo
