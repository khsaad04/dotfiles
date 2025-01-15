return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            palette_overrides = {
                dark0_hard = "#13140c",
                dark1 = "#1c1c14",
                dark2 = "#202018",
            },
        })
        vim.opt.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end,
}
