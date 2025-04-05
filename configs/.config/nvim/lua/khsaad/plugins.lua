return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("khsaad.colorscheme")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSInstall all",
        opts = {
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        keys = {
            {
                "<leader>vmm",
                "<Plug>(VM-Toggle-Mappings)",
                mode = "n",
                desc = "[V]isual-[M]ulti Toggle [M]appings",
            },
        },
        init = function()
            vim.g.VM_add_cursor_at_pos_no_mappings = 1
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },
    {
        "saghen/blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "nix run .#build-plugin",
        opts = {},
    },
    {
        "echasnovski/mini.files",
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        opts = {
            mappings = {
                close = "<Esc>",
                go_in_plus = "<CR>",
            },
        },
        keys = {
            {
                "<C-e>",
                function()
                    if not MiniFiles.close() then
                        MiniFiles.open(vim.api.nvim_buf_get_name(0))
                    end
                end,
                desc = "File [E]xplorer",
            },
        },
    },
    {
        "echasnovski/mini.pick",
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        opts = {},
        keys = {
            {
                "<leader>sf",
                function()
                    MiniPick.builtin.files()
                end,
                desc = "[S]earch [F]iles",
            },
            {
                "<leader>sg",
                function()
                    MiniPick.builtin.grep_live()
                end,
                desc = "[S]earch by [G]rep",
            },
            {
                "<leader>sh",
                function()
                    MiniPick.builtin.help()
                end,
                desc = "[S]earch [H]elp",
            },
        },
    },
}
