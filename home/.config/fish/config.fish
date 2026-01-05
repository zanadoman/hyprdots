not status is-interactive && return
set -U fish_greeting
set -x LIBRARY_PATH "/usr/local/lib/:$LIBRARY_PATH"
set -x LD_LIBRARY_PATH "/usr/local/lib/:$LD_LIBRARY_PATH"
set -x PATH "$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH:$ANDROID_SDK_ROOT/tools/bin/:$ANDROID_SDK_ROOT/platform-tools/:$ANDROID_SDK_ROOT/emulator"
set -x DEBUGINFOD_URLS https://debuginfod.archlinux.org
set -x ANDROID_SDK_ROOT /opt/android-sdk
set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock
set -x PAGER less
set -x VISUAL nvim
set -x TERMINAL foot
set -x BROWSER chromium
set -x OPENER rifle
set -x CMAKE_GENERATOR Ninja
fish_vi_key_bindings
bind -M insert \ef forward-word
bind -M insert \cf accept-autosuggestion
starship init fish | source
function fish_mode_prompt; echo \ ; end
zoxide init fish --cmd cd | source
fzf --fish | source
alias clear='clear && fastfetch'
alias valgrind='env VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json valgrind'
alias wine='env -u DISPLAY wine'
alias sdkmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk sdkmanager'
alias avdmanager='env JAVA_HOME=/usr/lib/jvm/java-8-openjdk avdmanager'
alias hyprland='test $XDG_SESSION_TYPE = tty && command hyprland && clear'
alias start-hyprland='test $XDG_SESSION_TYPE = tty && command start-hyprland && clear'
clear

function fish_should_add_to_history
    string match -rq ^\  -- $argv; and return 1; or return 0
end

function merge_history --on-event fish_prompt
    history merge
end

function tmux
    if test 0 -lt (count $argv)
        command tmux $argv
    else if test (basename $PWD) = $USER
        set selection (command tmux list-sessions -F '#{session_id}: #{session_name}' | fzf -1 -0 | grep -Po '^\$[0-9]+')
        if test -n $selection
            command tmux attach-session -t $selection
        end
    else
        command tmux attach-session -t (basename $PWD) &>/dev/null || command tmux new-session -s (basename $PWD)
    end
end
