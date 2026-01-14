return {
    'stevearc/oil.nvim',
    dependencies = {
        "nvim-mini/mini.icons",
    },
    lazy = false,
    config = function()
        local oil = require("oil")

        oil.setup({
            default_file_explorer = true,
            columns = {
                "icon",
            },
            keymaps = {
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["q"] = { "actions.close", mode = "n" },
            },
            delete_to_trash = false,
            view_options = {
                show_hidden = true,
            },
        })

        -- opens parent dir over current active window
        vim.keymap.set(
            "n",
            "-",
            "<CMD>Oil<CR>",
            { desc = "Open parent directory" }
        )
        -- open parent dir in float window
        vim.keymap.set(
            "n",
            "<leader>-",
            require("oil").toggle_float,
            { desc ="Open parent directory float" }
        )

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function()
                vim.opt_local.cursorline = true
            end,
        })
    end,
}
