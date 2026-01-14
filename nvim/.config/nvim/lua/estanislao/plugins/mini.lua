return {
    -- mini nvim
    { "nvim-mini/mini.nvim", version = false },

    -- comments
    {
        'nvim-mini/mini.comment',
        version = false,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            -- disable the autocommand from ts-context-commentstring
            require('ts_context_commentstring').setup {
                enable_autocmd = false,
            }

            require("mini.comment").setup {
                -- tsx, jsx, html , svelte comment support
                options = {
                    custom_commentstring = function()
                        return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
                    end,
                },
            }
        end
    },

    -- surround
    {
        "nvim-mini/mini.surround",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        opts = {}
    },

    -- Whitespaces
    {
        "nvim-mini/mini.trailspace",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local mini_trailspace = require("mini.trailspace")

            mini_trailspace.setup({
                only_in_normal_buffers = true,
            })

            vim.keymap.set("n", "<leader>cw", function() mini_trailspace.trim() end, { desc = "Erase Whitespace" })

            -- vim.api.nvim_create_autocmd("CursorMoved", {
            --     pattern = "*",
            --     callback = function()
            --         require("mini.trailspace").unhighlight()
            --     end,
            -- })
        end,
    },

    {
        "nvim-mini/mini.splitjoin",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local mini_splitjoin = require("mini.splitjoin")

            mini_splitjoin.setup({
            })
        end,
    }

    -- WARN: change a ts-comments
    -- {
    --     "folke/ts-comments.nvim",
    --     config = true,
    --     event = "VeryLazy",
    -- },
}
