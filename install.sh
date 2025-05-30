#!/bin/bash

# System
sudo cp -r ./etc/. /etc/

# Packages
cat ./pacman.txt | sudo pacman -Syu -
cat ./aur.txt | yay -Syu -
yes | sudo pacman -Rns $(pacman -Qdtq)

# User
xdg-user-dirs-update
mkdir -p "$HOME/.local/bin/"
cp -r ./home/. "$HOME/"

# Rust
rustup default stable
rustup default nightly

# Shell
chsh -s /bin/fish

# Daemons
sudo systemctl enable bluetooth.service
