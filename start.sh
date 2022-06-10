#!/usr/bin/env bash
echo "################################################################"
echo "Do you want to get the last github code in? - Internet required"
echo "It will overwrite anything you may have changed"
echo "Answer with y/Y or n/N"
echo "################################################################"
echo
read response
if [[ "$response" == [yY] ]]; then

	git reset --hard
	git pull

else
    echo "################################################################"
    echo "Nothing has been changed."
    echo "################################################################"
fi

echo
echo "################################################################"
echo "Making all .sh files executable"
echo "################################################################"
echo
chmod +x *.sh

echo "################################################################"
echo "chroot /mnt"
echo "################################################################"
arch-chroot /mnt

echo "################################################################"
echo "Starting nemesis basic"
echo "################################################################"
echo
./0-current-choices.sh

echo "################################################################"
echo "Do you want to get the run the workstation install script?"
echo "Answer with y/Y or n/N"
echo "################################################################"
echo
read response
if [[ "$response" == [yY] ]]; then

echo "################################################################"
echo "Starting nemesis workstation install script"
echo "################################################################"
echo
./500-install-workstation-software.sh

else
    echo "################################################################"
    echo "Nothing has been changed."
    echo "################################################################"
fi

echo "################################################################"
echo "exit chroot"
echo "################################################################"
exit
umount -R /mnt
