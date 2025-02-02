![Preview](/preview.png)

# Packages (998)

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
| alacritty                       | Terminal emulator.                         |
| fastfetch                       | System information.                        |
| fish                            | Smart shell.                               |
| starship                        | Improved prompt.                           |
| zoxide                          | Smart cd.                                  |

### CLI tools
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| bluetui                         | Bluetooth manager.                         |
| btop                            | Resource monitor.                          |
| fzf                             | Fuzzy finder.                              |
| less                            | Pager for Git.                             |
| man-db                          | Manual pages implementation.               |
| man-pages                       | Linux/POSIX manual pages.                  |
| pulsemixer                      | Audio manager.                             |
| ripgrep                         | Recursive search tool.                     |
| rocm-smi-lib                    | AMD GPU support for BTOP.                  |
| sshfs                           | Network filesystem client.                 |
| tree                            | Directory structure tool.                  |

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
| android-studio (AUR)            | Android IDE.                               |
| cmake                           | C/C++ build tool.                          |
| composer                        | PHP package manager.                       |
| dotnet-sdk                      | C# development kit.                        |
| doxygen                         | Documentation generator.                   |
| gradle                          | Java build tool.                           |
| jdk-openjdk                     | Java latest development kit.               |
| jdk17-openjdk                   | Java 17 development kit.                   |
| jdk8-openjdk                    | Java 8 development kit.                    |
| lld                             | LLVM linker for C/C++.                     |
| mariadb                         | MySQL compatible database system.          |
| mingw-w64-gcc                   | x86_64 Windows compiler for C/C++.         |
| npm                             | JavaScript package manager.                |
| openbsd-netcat                  | Networking tool.                           |
| rpi-imager                      | Raspberry Pi imager.                       |
| rustup                          | Rust toolchain installer.                  |
| sqlx-cli                        | SQLx migration tool.                       |
| valgrind                        | Debugging tool for C/C++.                  |
| virtualbox                      | Virtualization tool                        |
| watchexec                       | Live reload tool.                          |

### Media
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| chromium                        | Web browser.                               |
| gimp                            | Image manipulation program.                |
| onlyoffice-bin (AUR)            | Office suite.                              |
| pandoc-cli                      | Universal document converter.              |
| texlive-binextra                | LaTeX - optional dependencies.             |
| texlive-fontsrecommended        | LaTeX - essential fonts.                   |
| texlive-langenglish             | LaTeX - language support.                  |
| texlive-langeuropean            | LaTeX - language support.                  |
| texlive-latexextra              | LaTeX - useful packages.                   |
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

#### android-studio
- Help improve Android Studio: Don't send
- Choose the type of setup you want for Android Studio: Standard
- Downloading Components

#### discord
- Appearance: CHAT FONT SCALING: 20px
- Notifications: Enable Desktop Notifications: off
- Show Member List

#### filesystem
- /etc/fstab

#### git
- git config --global user.name
- git config --global user.email
- Generate new token (classic)

#### hyprland
- monitor
- input:kb_layout

#### networkmanager
- nmcli connection modify 'Wired connection 1' 802-3-ethernet.wake-on-lan magic

#### onlyoffice-bin
- Interface scaling *: 100%

#### openssh
- systemctl enable sshd.service
- systemctl start sshd.service
- "$HOME/.ssh/config"

#### spotify-launcher
- Startup and window behaviour: Close button should minimize the Spotify window: on

#### steam
- Storage: Add Drive
- Compatibility: Enable Steam Play for all other titles: on
- Controller: PlayStation Controller Support: Enabled
