local palette = {
    dark0 = "#13140c",
    dark1 = "#202018",
    dark2 = "#35352d",
}

require("gruvbox").setup({
    palette_overrides = palette,
    overrides = {
        StatusLine = { bg = "#202018", fg = "#e5e3d6" },
        StatusLineNC = { bg = "#202018", fg = "#e5e3d6" },
    },
})
vim.cmd.colorscheme("gruvbox")
