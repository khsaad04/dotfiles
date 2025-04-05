vim.opt.background = "dark"

local palette
if "dark" == "dark" then
    palette = {
        dark0 = "#13140c",
        dark1 = "#202018",
        dark2 = "#35352d",
    }
else
    palette = {
        light0 = "#13140c",
        light1 = "#202018",
        light2 = "#35352d",
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
