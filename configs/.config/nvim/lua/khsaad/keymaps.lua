vim.g.mapleader = " "

-- Clear highlights of search
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Duplicate line while saving cursor column position
vim.keymap.set("n", "yo", function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local text = vim.api.nvim_get_current_line()
    vim.cmd.normal("o")
    vim.api.nvim_set_current_line(text)
    vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
end, { desc = "Copy line below and save cursor position" })

-- Lsp & Diagnostics keymaps
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set(
    "n",
    "<leader>td",
    "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
    { desc = "[T]oggle [D]iagnostics" }
)
