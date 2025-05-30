[[ $- != *i* ]] && return
export PATH="$HOME/.local/bin/:$HOME/.cargo/bin/:$PATH"
export PAGER=less
export VISUAL=nvim
export TERMINAL=foot
export BROWSER=chromium
alias wine='env -u DISPLAY wine'
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
