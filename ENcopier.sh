#!/bin/bash

figlet HYPERcopy
echo '''
[a] - About the script

[h] - Help page

[l] - Links

[c] - Copy a file or do something else
'''

# functions

#about
about() {
	echo '''
ABOUT:

This script was created to optimize a process of copying files. Also it can do a specific work on files.

					Made with BASH. Compiled with SHC. Version 1.2.
'''
}

#help
help() {
	echo '''
HELP:

[/PATH/TO/THE/FILE] - You need enter a path to the file you want copy

[~~rmall/all] - Remove the output/ directory

[~~rmall/in] - Remove files in output/
'''
}

#links
links() {
	echo '''
LINKS:

t.me/gnulinuh (Telegram)
'''
}

#main
main() {
	read -p "/PATH/TO/THE/FILE: " path

	mkdir output
	echo "Waiting for sudo.."
	sudo echo
	echo "Copying.."
	sudo cp $path output/
	echo "[ DONE ]"
	echo "Giving permissions.."
	sudo chmod 777 output/*
	echo "[ DONE ]"

	echo "File successfully copied."
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
echo "output/ has been deleted."

elif [ $input = "~~rmall/in" ] ; then
sudo rm -rf output/*
echo "All files in output/ have been deleted."

fi

echo '''
Continue?'''

read -p "[y], [n]: " repeat

if [ $repeat = "y" ] ; then
clear ; hcp
fi
