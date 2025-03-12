#!/bin/bash

echo "Вы хотите установить зависимости (shc, figlet)?"
read -p "[y], [n]: " depend

if [ $depend = "y" ] ; then
echo '''
Выберите свой дистрибутив:

[u] - Debain-based дистрибутив
[d] - DNF дистрибутив
[a] - Arch-based дистрибутив
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
shc -f RUcopier.sh
mv RUcopier.sh.x copier
sudo cp copier /usr/bin/
sudo cp hcp /usr/sbin/

echo '''
Готово! Теперь вы можете запустить HYPERcopy с помощью терминала. Чтобы сделать это, напишите "hcp".
'''
