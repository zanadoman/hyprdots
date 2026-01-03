[[ $- != *i* ]] && return
export LIBRARY_PATH="/usr/local/lib/:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"
export PATH="$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH:$ANDROID_SDK_ROOT/tools/bin/:$ANDROID_SDK_ROOT/platform-tools/:$ANDROID_SDK_ROOT/emulator/"
export DEBUGINFOD_URLS=https://debuginfod.archlinux.org
export ANDROID_SDK_ROOT=/opt/android-sdk
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export PAGER=less
export VISUAL=nvim
export TERMINAL=foot
export BROWSER=chromium
export OPENER=rifle
set -o vi
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
alias clear='clear && fastfetch'
alias valgrind='env VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json valgrind'
alias wine='env -u DISPLAY wine'
alias sdkmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk sdkmanager'
alias avdmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk avdmanager'
alias hyprland='[ $XDG_SESSION_TYPE = tty ] && hyprland && clear'
alias start-hyprland='[ $XDG_SESSION_TYPE = tty ] && start-hyprland && clear'
clear

tmux () {
    if [ 0 -lt $# ]; then
        command tmux "$@"
        return
    elif [ "$(basename "$PWD")" = "$USER" ]; then
        selection=$(command tmux list-sessions -F '#{session_id}: #{session_name}' | fzf -1 -0 | grep -Po '^\$[0-9]+')
        if [ -n $selection ]; then
            command tmux attach-session -t $selection
        fi
    else
        command tmux attach-session -t "$(basename "$PWD")" &>/dev/null || command tmux new-session -s "$(basename "$PWD")"
    fi
}
