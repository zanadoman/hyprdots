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
yes | sudo env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/sdkmanager --licenses
sudo env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/sdkmanager platform-tools 'platforms;android-34' 'build-tools;30.0.3' 'build-tools;34.0.0' emulator 'system-images;android-34;google_apis_playstore;x86_64'
env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/avdmanager create avd --name android34 --package 'system-images;android-34;google_apis_playstore;x86_64' --device pixel
env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/avdmanager create avd --name android34_tablet --package 'system-images;android-34;google_apis_playstore;x86_64' --device pixel_c
echo 'hw.keyboard = yes' >> "$HOME/.android/avd/android34.avd/config.ini"
echo 'hw.keyboard = yes' >> "$HOME/.android/avd/android34_tablet.avd/config.ini"

# C#
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
mkdir "$HOME/Qemu/"
mkdir "$HOME/Videos/"
mkdir -p "$HOME/.local/bin/"
