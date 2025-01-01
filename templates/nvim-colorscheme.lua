return {
    {
        "ellisonleao/gruvbox.nvim",
        dependencies = { "nvim-lualine/lualine.nvim" },
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                palette_overrides = {
                    dark0_hard = "#{{surface}}",
                },
            })
            local custom_gruvbox = require("lualine.themes.gruvbox")
            custom_gruvbox = {
                normal = {
                    a = { bg = "#{{primary}}", fg = "#{{on_primary}}", gui = "bold" },
                    b = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}" },
                    c = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                },
                insert = {
                    a = { bg = "#{{tertiary}}", fg = "#{{on_tertiary}}", gui = "bold" },
                    b = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}" },
                    c = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                },
                visual = {
                    a = { bg = "#{{secondary}}", fg = "#{{on_secondary}}", gui = "bold" },
                    b = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}" },
                    c = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                },
                replace = {
                    a = { bg = "#{{error}}", fg = "#{{on_error}}", gui = "bold" },
                    b = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}" },
                    c = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                },
                command = {
                    a = { bg = "#{{primary}}", fg = "#{{on_primary}}", gui = "bold" },
                    b = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}" },
                    c = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                },
                inactive = {
                    a = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}", gui = "bold" },
                    b = { bg = "#{{surface_container_high}}", fg = "#{{on_surface}}" },
                    c = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                },
            }
            custom_gruvbox.normal.c.bg = "#{{surface_container}}"
            custom_gruvbox.normal.c.fg = "#{{on_surface}}"

            require("lualine").setup({
                options = { theme = custom_gruvbox },
            })
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}
