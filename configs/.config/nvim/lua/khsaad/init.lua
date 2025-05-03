require("khsaad.options")
require("khsaad.keymaps")
require("khsaad.autocmds")
require("khsaad.lsp")

-- Clone "mini.nvim" manually in a way that it gets managed by "mini.deps"
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
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

-- Set up "mini.deps" (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    add({ source = "ellisonleao/gruvbox.nvim" })
    require("khsaad.colorscheme")
end)

later(function()
    add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end,
        },
    })
    require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
    })
end)

later(function()
    require("mini.icons").setup()
end)

later(function()
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
    add({ source = "mg979/vim-visual-multi" })
    vim.keymap.set("n", "<leader>vmm", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle [V]isual [M]ulti [M]appings" })
end)

later(function()
    add({ source = "lewis6991/gitsigns.nvim" })
    require("gitsigns").setup()
end)

later(function()
    add({ source = "tpope/vim-fugitive" })
end)

later(function()
    add({
        source = "saghen/blink.cmp",
        depends = { "rafamadriz/friendly-snippets" },
        version = "v1.1.1"
    })
    require("blink.cmp").setup()
end)

later(function()
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
end)

later(function()
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
end)
