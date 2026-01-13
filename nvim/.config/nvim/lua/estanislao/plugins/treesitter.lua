return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.config")

        treesitter.setup({
            ensure_installed = {
                "lua",
                "luadoc",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "c",
                "rust",
                "bash",
                "go",
                "jsdoc",
            },
            auto_install = false,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            additional_vim_regex_highlighting = false,
        })
    end,
}
