local palette = {
    dark0 = "#14140c",
    dark1 = "#202018",
    dark2 = "#36352c",
}

require("gruvbox").setup({
    palette_overrides = palette,
    overrides = {
        StatusLine = { bg = "#202018", fg = "#e5e3d6" },
        StatusLineNC = { bg = "#202018", fg = "#e5e3d6" },
    },
})
vim.cmd.colorscheme("gruvbox")
