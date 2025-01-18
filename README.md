![Preview](/preview.png)

# Packages (969)

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
| slurp                           | Area selection tool.                       |
| ttf-hack-nerd                   | Source code font.                          |
| ttf-input-nerd                  | Font provider.                             |
| waybar                          | Status bar.                                |
| wl-clipboard                    | Clipboard tool.                            |
| xdg-desktop-portal-hyprland     | Screen sharing tool.                       |

### Terminal
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| kitty                           | Terminal emulator.                         |
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
| ranger                          | Vim-inspired filemanager.                  |
| highlight                       | Syntax highlighting for ranger.            |

### Archiving
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| atool                           | Archive manager.                           |
| 7zip                            | 7-Zip support for atool.                   |
| unrar                           | RAR support for atool.                     |
| zip                             | Zip support for atool.                     |

### Programming
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| aarch64-linux-gnu-gcc           | AArch64 Linux compiler for C/C++.          |
| android-ndk (AUR)               | Android compiler for C/C++.                |
| android-studio (AUR)            | Android IDE.                               |
| cargo-watch                     | Rust live reload tool.                     |
| cmake                           | C/C++ build tool.                          |
| composer                        | PHP package manager.                       |
| dotnet-sdk                      | C# development kit.                        |
| doxygen                         | Documentation generator.                   |
| gradle                          | Java build tool.                           |
| jdk17-openjdk                   | Java development kit.                      |
| lld                             | LLVM linker.                               |
| mariadb                         | MySQL compatible database system.          |
| mingw-w64-gcc                   | x86_64 Windows compiler for C/C++.         |
| npm                             | JavaScript package manager.                |
| openbsd-netcat                  | Networking tool.                           |
| rustup                          | Rust toolchain installer.                  |
| sqlx-cli                        | SQLx migration tool.                       |
| valgrind                        | Debugging tool for C/C++.                  |
| virtualbox                      | Virtualization tool                        |

### Media
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| gimp                            | Image manipulation program.                |
| google-chrome (AUR)             | Web browser.                               |
| texlive-binextra                | LaTeX - optional dependencies.             |
| texlive-fontsrecommended        | LaTeX - essential fonts.                   |
| texlive-langenglish             | LaTeX - language support.                  |
| texlive-langeuropean            | LaTeX - language support.                  |
| texlive-latexextra              | LaTeX - useful packages.                   |
| texlive-plaingeneric            | LaTeX - Doxygen dependency.                |
| pandoc-cli                      | Universal document converter.              |
| wf-recorder                     | Screen recording tool.                     |

### Entertainment
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| discord                         | Discord client.                            |
| minecraft-launcher (AUR)        | Minecraft launcher.                        |
| noto-fonts-emoji                | Colored emoji font.                        |
| spotify-launcher                | Music streaming service.                   |
| steam                           | Steam client.                              |

### Compatibility
| Package                         | Description                                |
|:-------------------------------:|:-------------------------------------------|
| dosfstools                      | FAT compatibility tool.                    |
| ntfs-3g                         | NTFS compatibility tool.                   |
| wine                            | Windows compatibility layer.               |
| wine-mono                       | .NET Framework support for wine.           |

# Manual setup

#### hyprland
- Monitors
- Keyboard layouts

#### google-chrome
- Login

#### filesystem
- /etc/fstab

#### networkmanager
- 802-3-ethernet.wake-on-lan: magic

#### openssh
- systemctl enable sshd.service
- ~/.ssh/config

#### git
- Generate new token (classic)

#### android-studio
- Install SDK

#### discord
- Appearance: CHAT FONT SCALING: 20px
- Notifications: Enable Desktop Notifications: off
- Show Member List

#### steam
- Compatibility: Enable Steam Play for supported titles: on
- Download games

#### spotify-launcher
- Startup and window behaviour: Close button should minimize Spotify window: on
