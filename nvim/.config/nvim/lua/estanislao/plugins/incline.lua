return {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    enabled = true,
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
        local incline = require("incline")

        incline.setup({
            hide = {
                only_win = false,
            },
            window = {
                margin = { vertical = 1, horizontal = 1 },
            },
            render = function(props)
                if vim.bo[props.buf].filetype == "oil" then
                    return ""
                end

                local bufname = vim.api.nvim_buf_get_name(props.buf)
                local filename = vim.fn.fnamemodify(bufname, ":t")
                if filename == "" then filename = '[No Name]' end


                local icon, icon_color
                local ok, mini_icons = pcall(require, "mini.icons")

                if ok then
                    icon, icon_color = mini_icons.get("file", filename)
                else
                    icon, icon_color = "󰈚", "#ffffff"
                end

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
