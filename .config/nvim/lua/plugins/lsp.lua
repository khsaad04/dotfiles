return {
    "neovim/nvim-lspconfig",
    ft = { "python", "rust", "nix", "lua", "zig", "c" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
            on_attach = function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end
                nmap("<leader>q", require("telescope.builtin").diagnostics, "[Q]uickfix")
                nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                nmap("<space>e", vim.diagnostic.open_float, "Open diagnostic float")
            end,
            capabilities = capabilities,
        })

        -- Setup lsp server configs
        for server, config in pairs(require("config.lsp_config")) do
            lspconfig[server].setup(config)
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
    end,
}
