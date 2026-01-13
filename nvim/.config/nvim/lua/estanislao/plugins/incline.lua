return {
    "b0o/incline.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = { "nvim-mini/mini.icons" }, -- Repo actualizado
    config = function()
        local incline = require("incline")

        incline.setup({
            hide = {
                only_win = false,
            },
            render = function(props)
                local bufname = vim.api.nvim_buf_get_name(props.buf)
                local filename = vim.fn.fnamemodify(bufname, ":t")
                if filename == "" then filename = '[No Name]' end

                -- En nvim-mini/mini.icons la forma correcta es:
                local icon, icon_color = require("mini.icons").get("file", filename)

                local modified = vim.bo[props.buf].modified

                return {
                    { " ", icon, " ", guifg = icon_color },
                    { filename, gui = modified and "bold" or "none" },
                    modified and { " [+]", guifg = "#ff9e64" } or "",
                    " ",
                }
            end,
        })
    end,
}
