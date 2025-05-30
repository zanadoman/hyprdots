[[ $- != *i* ]] && return
export LIBRARY_PATH="/usr/local/lib/:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
export PKG_CONFIG_SYSROOT_DIR=/usr/x86_64-w64-mingw32
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_NDK_HOME=/opt/android-ndk
export PATH="$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH:$ANDROID_SDK_ROOT/tools/bin/:$ANDROID_SDK_ROOT/platform-tools/:$ANDROID_SDK_ROOT/emulator/:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/"
export PAGER=less
export VISUAL=nvim
export TERMINAL=foot
export BROWSER=chromium
export OPENER=rifle
alias wine='env -u DISPLAY wine'
alias sdkmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk sdkmanager'
alias avdmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk avdmanager'
alias clear='clear && fastfetch'
alias hyprland='[ $XDG_SESSION_TYPE = tty ] && hyprland && clear'
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
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

tmux () {
    if [ 0 -lt $# ]; then
        command tmux "$@"
    else
        command tmux attach-session &>/dev/null || command tmux new-session -s "$(basename "$PWD")"
    fi
}
