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
vim.opt.hlsearch       = false
vim.opt.clipboard      = "unnamedplus"
vim.opt.undofile       = true
vim.opt.swapfile       = false
vim.opt.ignorecase     = true
vim.opt.completeopt    = "fuzzy,menuone,noselect,popup"

-- [[ Colorscheme ]] --
--
require("colorscheme")

-- [[ Keymaps ]] --
--
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- Stay in visual mode while indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

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

later(function()
    -- vim-visual-multi
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
    add({ source = "mg979/vim-visual-multi" })
    vim.keymap.set("n", "<leader>vmm", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle visual multi mappings" })

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
    end, { desc = "Toggle file explorer" })

    -- mini.pick
    require("mini.pick").setup()

    vim.keymap.set("n", "<leader>sf", function()
        MiniPick.builtin.files()
    end, { desc = "Search files" })

    vim.keymap.set("n", "<leader>sg", function()
        MiniPick.builtin.grep_live()
    end, { desc = "Search by grep" })

    vim.keymap.set("n", "<leader>sh", function()
        MiniPick.builtin.help()
    end, { desc = "Search help" })

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

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
            if client:supports_method("textDocument/completion") then
                vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            end
        end,
    })

    vim.diagnostic.enable(false) -- disable diagnostics by default
end)
