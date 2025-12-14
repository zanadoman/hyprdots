#!/bin/bash

# System
sudo cp -r ./etc/. /etc/

# Packages
cat ./pacman.txt | sudo pacman -Syu -
cat ./aur.txt | yay -Syu -
yes | sudo pacman -Rns $(pacman -Qdtq)

# User
sudo usermod -aG docker "$USER"
xdg-user-dirs-update
mkdir "$HOME/Projects/"
mkdir "$HOME/Work/"
mkdir -p "$HOME/.local/bin/"
mkdir -p "$HOME/Qemu/Linux/"
mkdir -p "$HOME/Qemu/Windows/"
cp -r ./home/. "$HOME/"

# Android
yes | sudo env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/sdkmanager --licenses
sudo env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/sdkmanager \
    platform-tools \
    'platforms;android-34' \
    'build-tools;30.0.3' \
    'build-tools;34.0.0' \
    emulator \
    'system-images;android-34;google_apis_playstore;x86_64'

# Rust
rustup default stable

# Wine
sudo ln -s /bin/wine /bin/wine64

# Shell
chsh -s /bin/fish

# Daemons
sudo systemctl enable supergfxd.service
sudo systemctl enable bluetooth.service
