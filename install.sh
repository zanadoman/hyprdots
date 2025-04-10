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
sudo env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/sdkmanager platform-tools 'platforms;android-34' 'platforms;android-35' 'build-tools;30.0.3' 'build-tools;34.0.0' 'ndk;26.3.11579264' 'cmake;3.22.1' emulator 'system-images;android-34;google_apis_playstore;x86_64'
env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/avdmanager create avd --name android_phone --package 'system-images;android-34;google_apis_playstore;x86_64' --device pixel
echo 'hw.keyboard = yes' >> "$HOME/.android/avd/android_phone.avd/config.ini"
env JAVA_HOME=/usr/lib/jvm/java-8-openjdk /opt/android-sdk/tools/bin/avdmanager create avd --name android_tablet --package 'system-images;android-34;google_apis_playstore;x86_64' --device pixel_c
echo 'hw.keyboard = yes' >> "$HOME/.android/avd/android_tablet.avd/config.ini"

# C#
dotnet new install Avalonia.Templates

# Flutter
flutter config --no-analytics

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

# Directories
xdg-user-dirs-update
mkdir "$HOME/Projects/"
mkdir "$HOME/Qemu/"
mkdir -p "$HOME/.local/bin/"
