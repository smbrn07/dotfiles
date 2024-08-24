set -g fish_greeting

# Starship
starship init fish | source

# config
set -gx TERM xterm-kitty
set -gx EDITOR nvim
fish_config theme choose tokyonight_night

# fzf
set -gx FZF_DEFAULT_OPTS "--color=bg+:-1,gutter:-1"
fzf_configure_bindings --directory=\cf

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
