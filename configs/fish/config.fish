set fish_greeting
set -gx RIPGREP_CONFIG_PATH ~/.config/ripgreprc
set -gx EDITOR nvim
set -gx VISUAL nvim

# Path
fish_add_path -aP ~/.cargo/bin
fish_add_path -aP ~/.local/bin

if status is-interactive
    # Prompt
    starship init fish | source
    enable_transience
end
