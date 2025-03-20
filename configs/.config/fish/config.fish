status is-interactive; and begin
    # Aliases
    alias l 'ls -lah'
    alias t 'tmux attach || tmux new-session -s main tms'
    alias y yazi
    alias vi nvim
    alias vim nvim
    alias vimdiff "nvim -d"

    # Interactive shell initialisation
    set fish_greeting
    fish_vi_key_bindings
    fish_add_path -aP ~/.cargo/bin

    if test "$TERM" != dumb
        eval (starship init fish)
        enable_transience
    end
end
