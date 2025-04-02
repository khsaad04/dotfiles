return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".stylua.toml" },
    single_file_support = true,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "Snacks" },
            },
        },
    },
}
