return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<C-e>",
            "<cmd>Neotree toggle reveal=true<cr>",
            mode = "n",
            desc = "[?] Find recently opened files",
        },
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
        })
    end,
}
