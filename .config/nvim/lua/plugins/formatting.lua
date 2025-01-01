return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "n",
            desc = "Format current buffer using conform-nvim",
        },
    },
    opts = {
        formatters = {
            nix_formatter = {
                command = "formatter",
                args = { "$FILENAME" },
                stdin = false,
            },
        },
        formatters_by_ft = {
            nix = { "nix_formatter" },
            lua = { "stylua" },
            python = { "ruff_format" },
            c = { "clang-format" },
            html = { "prettierd" },
            javascript = { "prettierd" },
            css = { "prettierd" },
        },
    },
}
