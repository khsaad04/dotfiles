set fish_greeting # Reset default fish greeting message

set -gx RIPGREP_CONFIG_PATH ~/.config/ripgreprc # Load custom ripgrep config

# Set default text editor to nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

# Path
fish_add_path -aP ~/.cargo/bin
fish_add_path -aP ~/.local/bin

if status is-interactive
    starship init fish | source
    enable_transience # Comes from starship
end
