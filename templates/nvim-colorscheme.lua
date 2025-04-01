return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        vim.opt.background = "{{theme}}"
        local palette
        if "{{theme}}" == "dark" then
            palette = {
                dark0 = "#{{surface}}",
                dark1 = "#{{surface_container_low}}",
                dark2 = "#{{surface_container}}",
            }
        else
            palette = {
                light0 = "#{{surface}}",
                light1 = "#{{surface_container_low}}",
                light2 = "#{{surface_container}}",
            }
        end
        require("gruvbox").setup({
            palette_overrides = palette,
            overrides = {
                StatusLine = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
                StatusLineNC = { bg = "#{{surface_container}}", fg = "#{{on_surface}}" },
            },
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
