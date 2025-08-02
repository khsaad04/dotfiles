-- [[ Options ]] --
--
vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smartindent    = true

vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.wrap           = false
vim.opt.scrolloff      = 999
vim.opt.virtualedit    = "block"
vim.opt.signcolumn     = "yes"

vim.opt.clipboard      = "unnamedplus"
vim.opt.undofile       = true
vim.opt.swapfile       = false

vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.inccommand     = "split"

-- [[ Colorscheme ]] --
--
vim.cmd.colorscheme("retrobox")

-- [[ Keymaps ]] --
--
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights on search" })

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<space>e",   vim.diagnostic.open_float,                                             { desc = "Open diagnostic float"         })
vim.keymap.set("n", "<leader>q",  vim.diagnostic.setloclist,                                             { desc = "Open diagnostic quickfix list" })
vim.keymap.set("n", "<leader>td", "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>", { desc = "Toggle diagnostics"            })

vim.keymap.set("n", "yo", function()
    local pos  = vim.api.nvim_win_get_cursor(0)
    local text = vim.api.nvim_get_current_line()
    vim.cmd.normal("o")
    vim.api.nvim_set_current_line(text)
    vim.api.nvim_win_set_cursor(0, { pos[1] + 1, pos[2] })
end, { desc = "Copy line below and save cursor position" })

-- [[ Plugins ]] --
--
-- Clone "mini.nvim" manually in a way that it gets managed by "mini.deps"
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path    = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
    vim.cmd("echo 'Installing `mini.nvim`' | redraw")
    local clone_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim",
        mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd("echo 'Installed `mini.nvim`' | redraw")
end

-- Set up "mini.deps"
require("mini.deps").setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    -- tree-sitter highlights must load asap
    add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks  = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end,
        },
    })
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent    = { enable = true },
    })
end)

later(function()
    -- we can lazy load rest of these
    --
    -- vim-visual-multi
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
    add({ source = "mg979/vim-visual-multi" })
    vim.keymap.set("n", "<leader>vmm", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle [V]isual [M]ulti [M]appings" })

    -- blink.cmp
    add({
        source = "saghen/blink.cmp",
        depends = { "rafamadriz/friendly-snippets" },
        checkout = "v1.5.1",
    })
    require("blink.cmp").setup()

    -- mini.icons
    require("mini.icons").setup()

    -- mini.files
    require("mini.files").setup({
        mappings = {
            go_in_plus = "<CR>",
        },
    })

    vim.keymap.set("n", "<C-e>", function()
        if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
    end, { desc = "File [E]xplorer" })

    -- mini.pick
    require("mini.pick").setup()

    vim.keymap.set("n", "<leader>sf", function()
        MiniPick.builtin.files()
    end, { desc = "[S]earch [F]iles" })

    vim.keymap.set("n", "<leader>sg", function()
        MiniPick.builtin.grep_live()
    end, { desc = "[S]earch by [G]rep" })

    vim.keymap.set("n", "<leader>sh", function()
        MiniPick.builtin.help()
    end, { desc = "[S]earch [H]elp" })

    -- gitsigns
    add({ source = "lewis6991/gitsigns.nvim" })
    require("gitsigns").setup()

    -- vim-fugitive
    add({ source = "tpope/vim-fugitive" })

    -- nvim-lspconfig
    add({ source = "neovim/nvim-lspconfig" })

    vim.lsp.enable({
        "clangd",
        "lua_ls",
        "pylsp",
        "ruff",
        "rust_analyzer",
    })

    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    })

    vim.diagnostic.enable(false) -- disable diagnostics by default
end)
