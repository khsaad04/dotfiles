local map = vim.keymap.set

vim.g.mapleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Clear highlights on search
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })

-- Stay in indent mode while indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move Lines
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- greatest remaps ever
map("x", "p", [["_dp]])
map("x", "P", [["_dP]])

map("n", "yo", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local text = vim.api.nvim_get_current_line()
    vim.cmd.normal("o")
    vim.api.nvim_set_current_line(text)
    vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
end, { desc = "Copy line below and save cursor position" })

-- Lsp & Diagnostics keymaps
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Lsp Format" })
map("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map(
    "n",
    "<leader>td",
    "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
    { desc = "[T]oggle [D]iagnostics" }
)
