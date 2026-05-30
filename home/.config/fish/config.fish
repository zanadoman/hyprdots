not status is-interactive && return
set -U fish_greeting
set -g fish_cursor_default beam
set -x LIBRARY_PATH /usr/local/lib/:$LIBRARY_PATH
set -x LD_LIBRARY_PATH /usr/local/lib/:$LD_LIBRARY_PATH
set -x ANDROID_HOME /opt/android-sdk
set -x PATH $HOME/.local/bin/:$PATH:$ANDROID_HOME/tools/bin/:$ANDROID_HOME/platform-tools/:$ANDROID_HOME/emulator/
alias avdmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk avdmanager'
alias clear='clear && fastfetch'
alias hyprland='test $XDG_SESSION_TYPE = tty && command hyprland && clear'
alias sdkmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk sdkmanager'
alias start-hyprland='test $XDG_SESSION_TYPE = tty && command start-hyprland && clear'
alias valgrind='env VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.json valgrind'
alias wf-recorder='wf-recorder -c h264_nvenc --audio=alsa_output.pci-0000_65_00.6.analog-stereo.monitor'
set -x PAGER less
set -x VISUAL nvim
set -x TERMINAL foot
set -x BROWSER chromium
starship init fish | source
zoxide init fish --cmd cd | source
fzf --fish | source
clear

function tmux
    if test 0 -lt (count $argv)
        command tmux $argv
    else if test (basename $PWD) = $USER
        sesh picker
    else
        command tmux attach-session -t (basename $PWD) &>/dev/null || command tmux new-session -s (basename $PWD)
    end
end
