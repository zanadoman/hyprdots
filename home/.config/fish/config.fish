not status is-interactive && return
set -U fish_greeting
set -x PATH "$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH"
set -x PAGER less
set -x VISUAL nvim
set -x TERMINAL foot
set -x BROWSER chromium
alias wine='env -u DISPLAY wine'
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
