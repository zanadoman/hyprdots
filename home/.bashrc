[[ $- != *i* ]] && return
export LIBRARY_PATH="/usr/local/lib/:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
export ANDROID_NDK_HOME=/opt/android-ndk
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH="$HOME/.local/bin/:$PATH:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/:$ANDROID_SDK_ROOT/tools/bin/:$ANDROID_SDK_ROOT/platform-tools/:$ANDROID_SDK_ROOT/emulator/"
export PAGER=less
export VISUAL=nvim
export TERMINAL=foot
export BROWSER=chromium
export OPENER=rifle
alias clear='clear && fastfetch'
alias hyprland='hyprland && clear'
alias wine='env -u DISPLAY wine'
eval "$(zoxide init --cmd cd bash)"
eval "$(starship init bash)"
clear

ff () {
    if [ $# -eq 0 ]; then
        root=./
    else
        root=$@
    fi
    find $root -mindepth 1 -type f | fzf
}

frg () {
    if [ $# -eq 0 ]; then
        root=./
    else
        root=$@
    fi
    selected=$(cat $(find $root -mindepth 1 -type f) | fzf)
    if [ -n "$selected" ]; then
        rg -.lF "$selected"
    fi
}

fd () {
    if [ $# -eq 0 ]; then
        root=./
    else
        root=$@
    fi
    find $root -mindepth 1 -type d | fzf
}

fcd () {
    if [ $# -eq 0 ]; then
        root=./
    else
        root=$@
    fi
    selected=$(find $root -mindepth 1 | fzf)
    if [ -n "$selected" ]; then
        if [ -d "$selected" ]; then
            cd "$selected"
        else
            cd "$(dirname "$selected")"
        fi
    fi
}
