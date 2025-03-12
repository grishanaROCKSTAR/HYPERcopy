#!/bin/bash

figlet HYPERcopy
echo '''
[a] - О скрипте

[h] - Команды (помощь)

[l] - Ссылки

[c] - Скопировать файл или сделать что-то еще
'''

# functions

#about
about() {
	echo '''
О СКРИПТЕ:

Этот скрипт был сделать чтобы оптимизировать копирование файлов. Также он может выполнять различную работу с файлами.

					Написано на BASH. Скомпилировано с помощью SHC. Версия 1.2.
'''
}

#help
help() {
	echo '''
ПОМОЩЬ:

[/ПУТЬ/К/ФАЙЛУ/] - Введите путь к файлу, который вы хотите скопировать

[~~rmall/all] - Удалить output/ директорию

[~~rmall/in] - Удалить файлы в output/ директории
'''
}

#links
links() {
	echo '''
ССЫЛКИ:

t.me/gnulinuh (Telegram)
'''
}

#main
main() {
	read -p "/ПУТЬ/К/ФАЙЛУ/: " path

	mkdir output
	echo "Ожидание от sudo.."
	sudo echo
	echo "Копирование.."
	sudo cp $path output/
	echo "[ ГОТОВО ]"
	echo "Выдача разрешений.."
	sudo chmod 777 output/*
	echo "[ ГОТОВО ]"

	echo "Файл успешно скопирован."
	return
}

read -p "~: " input #input

if [ $input = "a" ] ; then
about

elif [ $input = "h" ] ; then
help

elif [ $input = "l" ] ; then
links

elif [ $input = "c" ] ; then
main

elif [ $input = "~~rmall/all" ] ; then
sudo rm -rf output/
echo "output/ был удален."

elif [ $input = "~~rmall/in" ] ; then
sudo rm -rf output/*
echo "Файлы в output/ были удалены."

fi

echo '''
Продолжить?'''

read -p "[y], [n]: " repeat

if [ $repeat = "y" ] ; then
clear ; hcp
fi
