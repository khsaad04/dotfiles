set fish_greeting
set -gx RIPGREP_CONFIG_PATH ~/.config/ripgreprc
set -gx EDITOR nvim
set -gx VISUAL nvim

# Aliases
alias l 'ls -lah'
alias t 'tmux a || tmux new -s main'
alias y yazi
alias vi nvim
alias vim nvim
alias vimdiff "nvim -d"

# Path
fish_add_path -aP ~/.cargo/bin
fish_add_path -aP ~/bin

if status is-interactive
    # Prompt
    starship init fish | source
    enable_transience
end
