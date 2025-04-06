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
})

-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})
vim.diagnostic.enable(false)
