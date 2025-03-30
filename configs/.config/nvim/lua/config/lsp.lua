-- Lsp
vim.lsp.enable({ "clangd", "luals", "nil_ls", "pylsp", "ruff", "rust-analyzer", })

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Lsp Format" })
-- Diagnostics
vim.diagnostic.config {
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
}
vim.diagnostic.enable(false)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set(
    "n",
    "<leader>td",
    "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
    { desc = "[T]oggle [D]iagnostics" }
)
