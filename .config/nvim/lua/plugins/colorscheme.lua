return {
    "ellisonleao/gruvbox.nvim",
    dependencies = { "nvim-lualine/lualine.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            palette_overrides = {
                dark0_hard = "#13140c",
            },
        })
        local custom_gruvbox = require("lualine.themes.gruvbox")
        custom_gruvbox = {
            normal = {
                a = { bg = "#c5cd7a", fg = "#2f3300", gui = "bold" },
                b = { bg = "#2a2a22", fg = "#e5e3d6" },
                c = { bg = "#202018", fg = "#e5e3d6" },
            },
            insert = {
                a = { bg = "#a2d0c1", fg = "#07372d", gui = "bold" },
                b = { bg = "#2a2a22", fg = "#e5e3d6" },
                c = { bg = "#202018", fg = "#e5e3d6" },
            },
            visual = {
                a = { bg = "#c7c9a6", fg = "#30321a", gui = "bold" },
                b = { bg = "#2a2a22", fg = "#e5e3d6" },
                c = { bg = "#202018", fg = "#e5e3d6" },
            },
            replace = {
                a = { bg = "#ffb4ab", fg = "#690005", gui = "bold" },
                b = { bg = "#2a2a22", fg = "#e5e3d6" },
                c = { bg = "#202018", fg = "#e5e3d6" },
            },
            command = {
                a = { bg = "#c5cd7a", fg = "#2f3300", gui = "bold" },
                b = { bg = "#2a2a22", fg = "#e5e3d6" },
                c = { bg = "#202018", fg = "#e5e3d6" },
            },
            inactive = {
                a = { bg = "#2a2a22", fg = "#e5e3d6", gui = "bold" },
                b = { bg = "#2a2a22", fg = "#e5e3d6" },
                c = { bg = "#202018", fg = "#e5e3d6" },
            },
        }
        custom_gruvbox.normal.c.bg = "#202018"
        custom_gruvbox.normal.c.fg = "#e5e3d6"

        require("lualine").setup({
            options = { theme = custom_gruvbox },
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
