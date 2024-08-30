set fish_greeting
set EDITOR nvim
set VISUAL zeditor

### SET MANPAGER
set -x MANPAGER "nvim +Man!"

# rust
source "$HOME/.cargo/env.fish"

### aliases 
alias icat "kitten icat"
alias ls "eza --icons"
alias ll "ls -l"
alias lla "ls -al"
alias lt "eza -aT"
alias yay paru

# zoxide
zoxide init fish | source
# fzf
fzf --fish | source
