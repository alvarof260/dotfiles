return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon.setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            }
        })

        -- Harpoon Add and UI
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
        vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu"})

        -- Harpoon marked files
        vim.keymap.set("n", "<C-u>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-i>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-o>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end)

        -- Harpoon previous and next files stored
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():next() end, { desc = "Harpoon previous file" })
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next file" })

    end
}
