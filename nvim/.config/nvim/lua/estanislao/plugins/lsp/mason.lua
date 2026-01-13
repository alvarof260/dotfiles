return {
    "mason-org/mason-lspconfig.nvim",
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
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
