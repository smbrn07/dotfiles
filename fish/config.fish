set fish_greeting
set EDITOR nvim
set VISUAL zeditor

### SET MANPAGER
set -x MANPAGER "nvim +Man!"

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

fish_add_path /home/smbrn07/.spicetify
