-- Lsp
vim.lsp.config("*", {
    root_markers = { ".git" },
    single_file_support = true,
})

vim.lsp.enable({
    "clangd",
    "luals",
    "nil_ls",
    "pylsp",
    "ruff",
    "rust-analyzer",
    "zls",
})

-- Diagnostics
vim.diagnostic.enable(false) -- disable diagnostic by default
