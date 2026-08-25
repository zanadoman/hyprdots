#!/bin/bash

# System
sudo cp -r ./etc/. /etc/

# Packages
cat ./pacman.txt | sudo pacman -Syu -
cat ./aur.txt | yay -Syu -
yes | sudo pacman -Rns $(pacman -Qdtq)

# User
mkdir "$HOME/Downloads/"
mkdir "$HOME/Documents/"
mkdir "$HOME/Videos/"
mkdir "$HOME/Pictures/"
mkdir "$HOME/Music/"
mkdir "$HOME/Projects/"
mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/Qemu/Linux/"
mkdir -p "$HOME/Qemu/Windows/"
cp -r ./home/. "$HOME/"

# Shell
chsh -s /bin/fish
