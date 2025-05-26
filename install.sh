#!/bin/bash

# System
sudo cp -r ./etc/. /etc/

# Packages
cat ./pacman.txt | sudo pacman -Syu -
cat ./aur.txt | yay -Syu -
yes | sudo pacman -Rns $(pacman -Qdtq)

# MariaDB
sudo mariadb-install-db --user=mysql --basedir=/usr/ --datadir=/var/lib/mysql/
sudo systemctl start mariadb.service
sudo mariadb-secure-installation

# User
sudo usermod -aG flutter "$USER"
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
    'platforms;android-35' \
    'build-tools;30.0.3' \
    'build-tools;34.0.0' \
    'ndk;26.3.11579264' \
    'cmake;3.22.1' \
    emulator \
    'system-images;android-34;google_apis_playstore;x86_64'

# C#
dotnet new install Avalonia.Templates

# Flutter
flutter config --no-analytics

# Ranger
git clone https://github.com/jchook/ranger-zoxide.git "$HOME/.config/ranger/plugins/zoxide/"

# Rust
rustup default stable
rustup default nightly
rustup target add aarch64-linux-android
rustup target add wasm32-unknown-unknown
rustup target add x86_64-linux-android
rustup target add x86_64-pc-windows-gnu

# Shell
chsh -s /bin/fish

# Bluetooth
sudo systemctl enable bluetooth.service
