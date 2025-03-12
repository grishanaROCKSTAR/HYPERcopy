#!/bin/bash

echo "Do you want to install dependencies? (shc, figlet)?"
read -p "[y], [n]: " depend

if [ $depend = "y" ] ; then
echo '''
Choose your distro:

[u] - Debain-based distro
[d] - DNF distro
[a] - Arch-based distro
'''
read -p "[ ]: " distro
if [ $distro = "u" ] ; then
sudo apt update ; sudo apt install shc figlet

elif [ $distro = "d" ] ; then
sudo dnf update ; sudo dnf install shc figlet

elif [ $distro = "a" ] ; then
git clone https://github.com/neurobin/shc.git
cd shc
bash configure
bash autogen.sh
make ; sudo make install
cd ..

sudo pacman -Sy figlet
fi
fi

sudo chmod +x hcp
shc -f ENcopier.sh
mv ENcopier.sh.x copier
sudo cp copier /usr/bin/
sudo cp hcp /usr/sbin/

echo '''
Done! Now you can run HYPERcopy via terminal. Just enter "hcp" command in your command line.
'''
