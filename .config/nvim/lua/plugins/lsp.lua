return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
            on_attach = function(_, bufnr)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
                vim.diagnostic.enable(false)
            end,
            capabilities = capabilities,
        })

        -- Setup lsp server configs
        for server, config in pairs(require("config.lsp_config")) do
            lspconfig[server].setup(config)
        end

        -- Diagnostics
        vim.keymap.set("n", "<leader>q", require("telescope.builtin").diagnostics, { desc = "[Q]uickfix" })
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
        local signs = {
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
        }
        for _, sign in ipairs(signs) do
            vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
        end
        vim.diagnostic.config({
            signs = {
                active = signs,
            },
            severity_sort = true,
        })
    end,
}
