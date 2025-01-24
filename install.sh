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

# C#
dotnet new install Avalonia.Templates

# Folders
mkdir "$HOME/Desktop/"
mkdir "$HOME/Documents/"
mkdir "$HOME/Downloads/"
mkdir "$HOME/Music/"
mkdir "$HOME/Pictures/"
mkdir "$HOME/Projects/"
mkdir "$HOME/Videos/"
mkdir "$HOME/VirtualBox VMs/"
