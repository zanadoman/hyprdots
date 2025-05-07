not status is-interactive && return
set -U fish_greeting
set -x LIBRARY_PATH "/usr/local/lib/:$LIBRARY_PATH"
set -x LD_LIBRARY_PATH "/usr/local/lib/:$LD_LIBRARY_PATH"
set -x ANDROID_SDK_ROOT /opt/android-sdk
set -x ANDROID_NDK_HOME /opt/android-ndk
set -x PATH "$HOME/.local/bin/:$PATH:$ANDROID_SDK_ROOT/tools/bin/:$ANDROID_SDK_ROOT/platform-tools/:$ANDROID_SDK_ROOT/emulator/:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/"
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
clear

function ff
    if test (count $argv) -eq 0
        set root ./
    else
        set root $argv
    end
    find $root -mindepth 1 -type f | fzf
end

function frg
    if test (count $argv) -eq 0
        set root ./
    else
        set root $argv
    end
    set selected (cat (find $root -mindepth 1 -type f) | fzf)
    if test -n "$selected"
        rg -.lF $selected
    end
end

function fd
    if test (count $argv) -eq 0
        set root ./
    else
        set root $argv
    end
    find $root -mindepth 1 -type d | fzf
end

function fcd
    if test (count $argv) -eq 0
        set root ./
    else
        set root $argv
    end
    set selected (find $root -mindepth 1 | fzf)
    if test -n "$selected"
        if test -d $selected
            cd $selected
        else
            cd (dirname $selected)
        end
    end
end

function tmux
    if test 0 -lt (count $argv)
        command tmux $argv
    else
        command tmux attach-session &>/dev/null || command tmux new-session -s (basename $PWD)
    end
end
