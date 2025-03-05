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

# Android
sudo archlinux-java set java-8-openjdk
yes | sudo env PATH="$PATH" sdkmanager --licenses
sudo env PATH="$PATH" sdkmanager platform-tools 'platforms;android-34' 'build-tools;30.0.3' 'build-tools;34.0.0' emulator 'system-images;android-34;google_apis_playstore;x86_64'
avdmanager create avd --name android34 --package 'system-images;android-34;google_apis_playstore;x86_64' --device pixel
echo 'hw.keyboard = yes' >> "$HOME/.android/avd/android34.avd/config.ini"
sudo archlinux-java set java-17-openjdk

# C#
sudo dotnet workload update
dotnet new install Avalonia.Templates

# MariaDB
sudo mariadb-install-db --user=mysql --basedir=/usr/ --datadir=/var/lib/mysql/
sudo systemctl start mariadb.service
sudo mariadb-secure-installation

# Rust
rustup default stable
rustup default nightly
rustup target add aarch64-linux-android
rustup target add wasm32-unknown-unknown
rustup target add x86_64-linux-android
rustup target add x86_64-pc-windows-gnu

# Folders
mkdir "$HOME/Desktop/"
mkdir "$HOME/Documents/"
mkdir "$HOME/Downloads/"
mkdir "$HOME/Music/"
mkdir "$HOME/Pictures/"
mkdir "$HOME/Projects/"
mkdir "$HOME/Videos/"
mkdir "$HOME/VirtualBox VMs/"
mkdir -p "$HOME/.local/bin/"
