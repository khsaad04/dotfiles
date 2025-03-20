return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        -- Setup lsp server configs
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        for server, config in pairs(require("config.lsp_config")) do
            require("lspconfig")[server].setup(vim.tbl_extend("force", config, {
                on_attach = function(_, _)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
                end,
                capabilities = capabilities,
            }))
        end

        -- Diagnostics
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
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
        vim.keymap.set(
            "n",
            "<leader>td",
            "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>",
            { desc = "[T]oggle [D]iagnostics" }
        )
        vim.diagnostic.enable(false)
    end,
}
