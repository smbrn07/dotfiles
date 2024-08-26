set -g fish_greeting

# aws cli
starship init fish | source
zoxide init fish | source

# config
set -gx TERM xterm-kitty
set -gx EDITOR nvim
fish_config theme choose tokyonight_night

# fzf
set -gx FZF_DEFAULT_OPTS "--color=bg+:-1,gutter:-1"
fzf_configure_bindings --directory=\cf

# aliases 
alias ls eza
alias la "ls -a --icons"
alias ll "ls -l --icons"
alias lla "ll -la --icons"
alias lt "ls --tree"
alias icat "kitten icat"
command -qv nvim && alias vim nvim
