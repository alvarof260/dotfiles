return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
        local persistence = require("persistence")

        persistence.setup({
        })

        -- load the session for the current directory
        vim.keymap.set(
            "n",
            "<leader>qs",
            function() require("persistence").load() end,
            { desc = "Restore session" }
        )

        -- select a session to load
        vim.keymap.set(
            "n",
            "<leader>qS",
            function() require("persistence").select() end,
            { desc = "Select session" }
        )

        -- load the last session
        vim.keymap.set(
            "n",
            "<leader>ql",
            function() require("persistence").load({ last = true }) end,
            { desc = "Restore last session" }
        )

        -- stop Persistence => session won't be saved on exit
        vim.keymap.set(
            "n",
            "<leader>qd",
            function() require("persistence").stop() end,
            { desc = "Don't save current session" }
        )
    end,
}
