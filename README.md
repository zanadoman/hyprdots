![Preview](/preview.png)

# Packages (1067)

### Prerequisites
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| git                             | Version control system.                    |
| yay                             | AUR package manager.                       |

### Hyprland
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| brightnessctl                   | Brightness manager.                        |
| fuzzel                          | Application launcher.                      |
| grim                            | Screenshot tool.                           |
| hyprland                        | Tiling compositor.                         |
| hyprpaper                       | Wallpaper tool.                            |
| hyprsunset                      | Bluelight filter.                          |
| noto-fonts                      | Font provider.                             |
| noto-fonts-emoji                | Colored emoji font.                        |
| slurp                           | Area selector.                             |
| ttf-hack-nerd                   | Source code font.                          |
| waybar                          | Status bar.                                |
| wl-clipboard                    | Clipboard manager.                         |
| xdg-desktop-portal-hyprland     | Screen sharing tool.                       |

### Terminal
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| fastfetch                       | System information.                        |
| fish                            | Smart shell.                               |
| foot                            | Terminal emulator.                         |
| starship                        | Improved prompt.                           |
| zoxide                          | Smart cd.                                  |

### CLI tools
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| bluetui                         | Bluetooth manager.                         |
| btop                            | Resource monitor.                          |
| fzf                             | Fuzzy finder.                              |
| man-db                          | Manual pages implementation.               |
| man-pages                       | Linux/POSIX manual pages.                  |
| pulsemixer                      | Audio manager.                             |
| ripgrep                         | Recursive search tool.                     |
| rocm-smi-lib                    | AMD GPU support for BTOP.                  |
| sshfs                           | Network filesystem client.                 |

### Editor
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| neovim                          | Vim-based text editor.                     |
| tree-sitter-cli                 | Improved syntax highlighting for NeoVim.   |

### File manager
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| highlight                       | Syntax highlighting for ranger.            |
| ranger                          | Vim-inspired filemanager.                  |
| ueberzugpp                      | Image preview for ranger.                  |

### Archiving
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| 7zip                            | 7-Zip support for atool.                   |
| atool                           | Archive manager.                           |
| unrar                           | RAR support for atool.                     |
| zip                             | ZIP support for atool.                     |

### Programming
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| aarch64-linux-gnu-gcc           | AArch64 Linux compiler for C/C++.          |
| android-ndk (AUR)               | Android compiler for C/C++.                |
| android-sdk (AUR)               | Android development kit.                   |
| cmake                           | C/C++ build tool.                          |
| composer                        | PHP package manager.                       |
| dotnet-sdk                      | C# development kit.                        |
| doxygen                         | Documentation generator.                   |
| fpc                             | Pascal compiler.                           |
| gradle                          | Java build tool.                           |
| gtest                           | C++ unit testing framework.                |
| jdk17-openjdk                   | Java 17 development kit.                   |
| jdk21-openjdk                   | Java 21 development kit.                   |
| jdk8-openjdk                    | Java 8 development kit.                    |
| linux-headers                   | Linux kernel headers.                      |
| lld                             | LLVM linker for C/C++.                     |
| mariadb                         | MySQL compatible database system.          |
| mingw-w64-gcc                   | x86_64 Windows compiler for C/C++.         |
| npm                             | JavaScript package manager.                |
| openbsd-netcat                  | Networking tool.                           |
| qemu-desktop                    | Virtualization tool.                       |
| rpi-imager                      | Raspberry Pi imager.                       |
| rustup                          | Rust toolchain installer.                  |
| sqlx-cli                        | SQLx migration tool.                       |
| v4l2loopback-dkms               | V4L2 loopback kernel module.               |
| valgrind                        | Debugging tool for C/C++.                  |
| wasm-pack                       | Rust WebAssembly build tool.               |
| watchexec                       | Live reload tool.                          |

### Media
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| anydesk-bin (AUR)               | Remote desktop application.                |
| chromium                        | Web browser.                               |
| gimp                            | Image manipulation program.                |
| onlyoffice-bin (AUR)            | Office suite.                              |
| pandoc-cli                      | Universal document converter.              |
| texlive-fontsrecommended        | LaTeX - essential fonts.                   |
| texlive-fontutils               | LaTeX - Doxygen dependency.                |
| texlive-langenglish             | LaTeX - language support.                  |
| texlive-langeuropean            | LaTeX - language support.                  |
| texlive-latexextra              | LaTeX - core packages.                     |
| texlive-plaingeneric            | LaTeX - Doxygen dependency.                |
| wf-recorder                     | Screen recorder.                           |

### Entertainment
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| discord                         | Discord client.                            |
| minecraft-launcher (AUR)        | Minecraft launcher.                        |
| spotify-launcher                | Music streaming service.                   |
| steam                           | Steam client.                              |

### Compatibility
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| dosfstools                      | FAT compatibility tool.                    |
| ntfs-3g                         | NTFS compatibility tool.                   |
| wine-mono                       | Windows compatibility layer.               |

# Manual setup

#### $HOME/.local/bin/android_emulator
- -camera-back webcamX

#### $HOME/.local/bin/android_emulator_camera
- video_dev_id=X

#### discord
- Appearance: CHAT FONT SCALING: 20px
- Notifications: Enable Desktop Notifications: off
- Show Member List

#### filesystem
- /etc/fstab

#### git
- git config --global user.email
- git config --global user.name
- Generate new token (classic)

#### hyprland
- monitor
- input:kb_layout

#### networkmanager
- nmcli connection modify 'Wired connection 1' 802-3-ethernet.wake-on-lan magic

#### onlyoffice-bin
- Interface scaling *: 100%

#### openssh
- systemctl enable --now sshd.service
- "$HOME/.ssh/config"

#### qemu-desktop
- "$HOME/Qemu/*.img"

#### spotify-launcher
- Startup and window behaviour: Close button should minimize the Spotify window: on

#### steam
- Storage: Add Drive
- Compatibility: Enable Steam Play for all other titles: on
- Controller: PlayStation Controller Support: Enabled
