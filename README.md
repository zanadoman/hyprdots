![Preview](./preview.png)
> Wallpaper: [$HOME/.config/hypr/wallpaper.jpg](./home/.config/hypr/wallpaper.jpg)

# [Packages (908)](./pkgs.lock)

### Prerequisites

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| git                               | Version control system                   |
| yay                               | AUR package manager                      |

### Desktop

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| asusctl (AUR)                     | ASUS control daemon                      |
| blueman                           | Bluetooth applet                         |
| brightnessctl                     | Brightness manager                       |
| dunst                             | Notification daemon                      |
| fuzzel                            | Application launcher                     |
| grim                              | Screenshot tool                          |
| hypridle                          | Idle management daemon                   |
| hyprland                          | Tiling compositor                        |
| hyprlock                          | Lock screen                              |
| hyprsunset                        | Bluelight filter                         |
| lib32-nvidia-utils                | NVIDIA Vulkan provider (32-bit)          |
| libnotify                         | Desktop notifications                    |
| network-manager-applet            | NetworkManager applet                    |
| noto-fonts                        | Font provider                            |
| noto-fonts-emoji                  | Colored emoji font                       |
| nvidia-open                       | Proprietary NVIDIA driver for Linux      |
| nwg-displays                      | Display manager                          |
| pavucontrol                       | Audio manager                            |
| slurp                             | Area selector                            |
| supergfxctl (AUR)                 | ASUS GPU manager                         |
| swaybg                            | Wallpaper tool                           |
| ttf-hack-nerd                     | Source code font                         |
| vulkan-radeon                     | AMD Vulkan provider                      |
| waybar                            | Status bar                               |
| wl-clipboard                      | Clipboard manager                        |
| xdg-desktop-portal-hyprland       | Screen sharing tool                      |

### Terminal

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| fastfetch                         | System information                       |
| fish                              | Smart shell                              |
| foot                              | Terminal emulator                        |
| lftp                              | Advanced FTP client                      |
| starship                          | Improved prompt                          |
| tmux                              | Terminal multiplexer                     |
| zoxide                            | Smart cd                                 |

### CLI tools

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| btop                              | Resource monitor                         |
| fzf                               | Fuzzy finder                             |
| imagemagick                       | Image manipulation program               |
| man-db                            | Manual pages implementation              |
| man-pages                         | Linux/POSIX manual pages                 |
| ripgrep                           | Recursive search tool                    |
| rocm-smi-lib                      | AMD GPU support for BTOP                 |
| smartmontools                     | Disk monitoring tool                     |
| tree                              | Recursive directory listing              |

### Editor

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| neovim                            | Vim-based text editor                    |
| tree-sitter-cli                   | Improved syntax highlighting for NeoVim  |

### Archiving

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| 7zip                              | 7-Zip support for atool                  |
| atool                             | Archive manager                          |
| unrar                             | RAR support for atool                    |
| zip                               | ZIP support for atool                    |

### Programming

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| aarch64-linux-gnu-gcc             | ARM64 compiler for C, C++                |
| android-aarch64-gtest (AUR)       | GoogleTest for ARM64 Android             |
| android-sdk (AUR)                 | Android development kit                  |
| android-x86-64-gtest (AUR)        | GoogleTest for x86-64 Android            |
| angular-cli (AUR)                 | Angular command-line interface           |
| cmake                             | C, C++ build tool                        |
| composer                          | PHP package manager                      |
| dbeaver                           | Universal database manager               |
| directx-shader-compiler-git (AUR) | Vulkan/DirectX shader compiler           |
| docker-compose                    | Docker orchestration tool                |
| docker-rootless-extras (AUR)      | Rootless Docker                          |
| doxygen                           | Documentation generator                  |
| github-cli                        | GitHub command-line interface            |
| gradle                            | Java build tool                          |
| jdk17-openjdk                     | Java 17 development kit                  |
| jdk21-openjdk                     | Java 21 development kit                  |
| jdk8-openjdk                      | Java 8 development kit                   |
| linux-headers                     | Linux kernel headers                     |
| lld                               | LLVM linker                              |
| mingw-w64-gcc                     | x86-64 Windows compiler for C, C++       |
| mingw-w64-gtest (AUR)             | GoogleTest for x86-64 Windows            |
| mono                              | Open-source .NET implementation          |
| networkmanager-openvpn            | NetworkManager OpenVPN plugin            |
| ninja                             | Performant CMake generator.              |
| perf                              | Performance profiler                     |
| qemu-desktop                      | Virtualization tool                      |
| renderdoc                         | OpenGL and Vulkan debugging tool         |
| rpi-imager                        | Raspberry Pi imager                      |
| rustup                            | Rust toolchain installer                 |
| sdl3-git (AUR)                    | Simple DirectMedia Layer                 |
| sqlx-cli                          | SQLx migration tool                      |
| v4l2loopback-dkms                 | V4L2 loopback kernel module              |
| valgrind                          | Debugging tool for C, C++                |
| vulkan-validation-layers          | Vulkan validation layers                 |
| watchexec                         | Live reload tool                         |

### Media

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| anydesk-bin (AUR)                 | Remote desktop application               |
| chromium                          | Web browser                              |
| gimp                              | Image manipulation program               |
| onlyoffice-bin (AUR)              | Office suite                             |
| texlive-fontsrecommended          | LaTeX - essential fonts                  |
| texlive-fontutils                 | LaTeX - Doxygen dependency               |
| texlive-langenglish               | LaTeX - language support                 |
| texlive-langeuropean              | LaTeX - language support                 |
| texlive-latexextra                | LaTeX - core packages                    |
| texlive-plaingeneric              | LaTeX - Doxygen dependency               |
| wf-recorder                       | Screen recorder                          |

### Entertainment

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| atlauncher-bin (AUR)              | Minecraft launcher                       |
| steam                             | Steam client                             |

### Compatibility

| Package                           | Description                              |
|:---------------------------------:|:-----------------------------------------|
| dosfstools                        | FAT compatibility tool                   |
| exfatprogs                        | exFAT compatibility tool                 |
| ntfs-3g                           | NTFS compatibility tool                  |
| wine-mono                         | Windows compatibility layer              |

# Manual setup

#### $HOME/.local/bin/android_emulator

- -camera-back webcamX

#### $HOME/.local/bin/screen_camera

- video_nr=X

#### chromium/discord

- Appearance: Chat Font Scaling: 20px
- Notifications: Enable Desktop Notifications: on
- Show Member List

#### git

- git config --global user.email
- git config --global user.name
- Generate new token (classic)

#### github-cli

- gh auth login

#### hyprland

- nwg-displays

#### onlyoffice-bin

- Interface scaling *: 100%

#### openssh

- "$HOME/.ssh/config"

#### qemu-desktop

- "$HOME/Qemu/**/*.img"

#### steam

- Compatibility: Enable Steam Play for all other titles: on
- Controller: PlayStation Controller Support: Enabled
