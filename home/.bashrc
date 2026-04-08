[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
export LIBRARY_PATH=/usr/local/lib/:$LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
export ANDROID_HOME=/opt/android-sdk
export PATH=$HOME/.local/bin/:$PATH:$ANDROID_HOME/tools/bin/:$ANDROID_HOME/platform-tools/:$ANDROID_HOME/emulator/
alias avdmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk avdmanager'
alias clear='clear && fastfetch'
alias hyprland='[ $XDG_SESSION_TYPE = tty ] && hyprland && clear'
alias sdkmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk sdkmanager'
alias start-hyprland='[ $XDG_SESSION_TYPE = tty ] && start-hyprland && clear'
alias valgrind='env VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json valgrind'
alias wf-recorder='wf-recorder -c h264_nvenc --audio=alsa_output.pci-0000_65_00.6.analog-stereo.monitor'
export PAGER=less
export VISUAL=nvim
export TERMINAL=foot
export BROWSER=chromium
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
clear

tmux () {
    if [ 0 -lt $# ]; then
        command tmux "$@"
    elif [ "$(basename "$PWD")" = "$USER" ]; then
        sesh picker
    else
        command tmux attach-session -t "$(basename "$PWD")" &>/dev/null || command tmux new-session -s "$(basename "$PWD")"
    fi
}
