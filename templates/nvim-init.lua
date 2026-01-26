-- [[ Options ]] --
--
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.wrap           = false
vim.opt.scrolloff      = 4
vim.opt.sidescrolloff  = 8
vim.opt.virtualedit    = "block"
vim.opt.signcolumn     = "yes"
vim.opt.cursorline     = true
vim.opt.cursorlineopt  = "number"
vim.opt.undofile       = true
vim.opt.swapfile       = false
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- [[ Autocmds ]] --
--
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    vim.opt.clipboard = "unnamedplus"
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Keymaps ]] --
--
vim.g.mapleader = " "

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

-- Enable nohlsearch
vim.cmd("packadd nohlsearch")

-- Set up "mini.deps"
require("mini.deps").setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    vim.cmd("colorscheme retrobox")

    vim.cmd("hi Normal        guifg=#{{on_surface}} guibg=#{{surface}}")
    vim.cmd("hi NormalFloat                 guibg=#{{surface_container}}")
    vim.cmd("hi FloatBorder   guifg=#{{outline}} guibg=#{{surface_container}}")
    vim.cmd("hi StatusLine    guifg=#{{on_primary_container}} guibg=#{{primary_container}}")
    vim.cmd("hi StatusLineNC  guifg=#{{on_secondary_container}} guibg=#{{secondary_container}}")
    vim.cmd("hi SignColumn                  guibg=#{{surface}}")
    vim.cmd("hi CursorLine                  guibg=#{{surface_variant}}")
    vim.cmd("hi CursorLineNr                guibg=#{{surface}}")
    vim.cmd("hi Pmenu         guifg=#{{on_surface}} guibg=#{{surface_container}}")
    vim.cmd("hi PmenuSel      guifg=#{{on_primary}} guibg=#{{primary}}")
    vim.cmd("hi PmenuMatch                  guibg=#{{surface_container}}")
    vim.cmd("hi PmenuMatchSel               guibg=#{{primary}}")
    vim.cmd("hi PmenuKind                   guibg=#{{surface_container}}")
    vim.cmd("hi PmenuKindSel                guibg=#{{primary}}")
    vim.cmd("hi PmenuExtra                  guibg=#{{surface_container}}")
    vim.cmd("hi PmenuExtraSel               guibg=#{{primary}}")
    vim.cmd("hi PmenuSbar                   guibg=#{{surface_container_low}}")
    vim.cmd("hi PmenuThumb                  guibg=#{{surface_container_high}}")

    add({ source = "nvim-treesitter/nvim-treesitter" })
    require("nvim-treesitter.configs").setup({
        highlight = { enable = true }
    })
end)

later(function()
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

    -- vim-fugitive
    add({ source = "tpope/vim-fugitive" })

    -- vim-visual-multi
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
    add({ source = "mg979/vim-visual-multi" })
    vim.keymap.set("n", "<leader>vmm", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle visual multi mappings" })
end)
