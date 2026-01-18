return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "mason-org/mason-lspconfig.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/lazydev.nvim", opts = {} },
    },
    config = function ()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        mason_lspconfig.setup({
            handlers = {
                function (server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end
            },
        })
    end,
}
