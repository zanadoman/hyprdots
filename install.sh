#!/bin/bash

# System
sudo cp -r ./etc/. /etc/

# Packages
cat ./pacman.txt | sudo pacman -Syu -
cat ./aur.txt | yay -Syu -
pacman -Qdtq | sudo pacman -Rns -

# User
cp -r ./home/. "$HOME/"
chsh -s /bin/fish

# MariaDB
sudo mariadb-install-db --user=mysql --basedir=/usr/ --datadir=/var/lib/mysql/
sudo systemctl start mariadb.service
sudo mariadb-secure-installation

# Rust
rustup default stable

# Folders
mkdir -p "$HOME/Desktop/"
mkdir -p "$HOME/Documents/"
mkdir -p "$HOME/Downloads/"
mkdir -p "$HOME/Music/"
mkdir -p "$HOME/Pictures/"
mkdir -p "$HOME/Projects/"
mkdir -p "$HOME/Videos/"
