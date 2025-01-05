return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
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
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    config = function()
        require("conform").setup({
            default_format_opts = {
                lsp_format = "fallback",
            },
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
        })
    end,
}
