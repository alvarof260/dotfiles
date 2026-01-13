return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
        local lualine = require("lualine")

        lualine.setup({
            icons_enabled = true,
        })
    end,
}
