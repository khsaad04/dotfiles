local palette = {
    dark0 = "#14140c",
    dark1 = "#202018",
    dark2 = "#36352c",
}

require("gruvbox").setup({
    palette_overrides = palette,
    overrides = {
        StatusLine = { bg = "#202018", fg = "#e6e2d5" },
        StatusLineNC = { bg = "#202018", fg = "#e6e2d5" },
    },
})
vim.cmd.colorscheme("gruvbox")
