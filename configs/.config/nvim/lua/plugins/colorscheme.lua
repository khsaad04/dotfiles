return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        vim.opt.background = "dark"
        local palette
        if "dark" == "dark" then
            palette = {
                dark0 = "#13140c",
                dark1 = "#1c1c14",
                dark2 = "#202018",
            }
        else
            palette = {
                light0 = "#13140c",
                light1 = "#1c1c14",
                light2 = "#202018",
            }
        end
        require("gruvbox").setup({
            palette_overrides = palette,
            overrides = {
                StatusLine = { bg = "#202018", fg = "#e5e3d6" },
                StatusLineNC = { bg = "#202018", fg = "#e5e3d6" },
            },
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
