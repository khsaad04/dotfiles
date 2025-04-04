return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSInstall all",
    opts = {
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
}
