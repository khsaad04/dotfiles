return {
    { -- Show Git signs on the signcolumn
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end,
    },
    { -- Git client
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },
    { -- Multi cursor support
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
}
