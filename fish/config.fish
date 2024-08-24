set -g fish_greeting

# Starship
starship init fish | source

# config
set -gx TERM xterm-kitty
set -gx EDITOR nvim
fish_config theme choose tokyonight_night

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias icat "kitten icat"
alias g git
command -qv nvim && alias vim nvim
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
