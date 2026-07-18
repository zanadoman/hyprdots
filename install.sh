#!/bin/bash

# System
sudo cp -r ./etc/. /etc/

# Packages
cat ./pacman.txt | sudo pacman -Syu -
cat ./aur.txt | yay -Syu -
yes | sudo pacman -Rns $(pacman -Qdtq)

# User
sudo usermod -aG flutter "$USER"
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

# Android
sudo /opt/android-sdk/cmdline-tools/latest/bin/sdkmanager \
    'build-tools;35.0.0' \
    'build-tools;36.0.0' \
    'cmake;3.22.1' \
    emulator \
    'ndk;28.2.13676358' \
    platform-tools \
    'platforms;android-36' \
    'system-images;android-36.1;google_apis_playstore;x86_64'

# Flutter
flutter --disable-analytics

# Shell
chsh -s /bin/fish
