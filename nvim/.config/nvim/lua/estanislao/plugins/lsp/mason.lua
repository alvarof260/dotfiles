return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "vtsls",
                "astro",
                "lua_ls",
                "prismals",
                "pyright",
                "eslint",
                "tailwindcss",
                "clangd",
                "rust_analyzer",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier",
                "stylua",
            },
        },
    }
}
