not status is-interactive && return
set -U fish_greeting
set -x LIBRARY_PATH "/usr/local/lib/:$LIBRARY_PATH"
set -x LD_LIBRARY_PATH "/usr/local/lib/:$LD_LIBRARY_PATH"
set -x ANDROID_SDK_ROOT /opt/android-sdk
set -x ANDROID_NDK_HOME /opt/android-ndk
set -x PATH "$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH:$ANDROID_SDK_ROOT/tools/bin/:$ANDROID_SDK_ROOT/platform-tools/:$ANDROID_SDK_ROOT/emulator/:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/"
set -x PAGER less
set -x VISUAL nvim
set -x TERMINAL foot
set -x BROWSER chromium
set -x OPENER rifle
alias wine='env -u DISPLAY wine'
alias sdkmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk sdkmanager'
alias avdmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk avdmanager'
alias clear='clear && fastfetch'
alias hyprland='test $XDG_SESSION_TYPE = tty && command hyprland && clear'
starship init fish | source
zoxide init fish --cmd cd | source
fzf --fish | source
clear

function tmux
    if test 0 -lt (count $argv)
        command tmux $argv
    else
        command tmux attach-session -t (basename $PWD) &>/dev/null || command tmux new-session -s (basename $PWD)
    end
end
