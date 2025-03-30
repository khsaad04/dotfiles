return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        if "dark" == "dark" then
            require("gruvbox").setup({
                palette_overrides = {
                    dark0 = "#13140c",
                    dark1 = "#1c1c14",
                    dark2 = "#202018",
                },
                overrides = {
                    StatusLine = { bg = "#202018", fg = "#e5e3d6" },
                    StatusLineNC = { bg = "#202018", fg = "#e5e3d6" }
                }
            })
        else
            require("gruvbox").setup({
                palette_overrides = {
                    light0 = "#13140c",
                    light1 = "#1c1c14",
                    light2 = "#202018",
                },
                overrides = {
                    StatusLine = { bg = "#202018", fg = "#e5e3d6" },
                    StatusLineNC = { bg = "#202018", fg = "#e5e3d6" }
                }
            })
        end
        vim.opt.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end,
}
