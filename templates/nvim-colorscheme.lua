return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        vim.opt.background = "{{theme}}"
        local palette
        if "{{theme}}" == "dark" then
            palette = {
                dark0 = "#{{surface}}",
                dark1 = "#{{surface_container}}",
                dark2 = "#{{surface_container_highest}}",
            }
        else
            palette = {
                light0 = "#{{surface}}",
                light1 = "#{{surface_container}}",
                light2 = "#{{surface_container_highest}}",
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
