return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".stylua.toml" },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}
