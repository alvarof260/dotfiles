return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	config = function()
		local lualine = require("lualine")

		local mode = {
			"mode",
			fmt = function(str)
				-- return ' '
				-- displays only the first character of the mode
				return " " .. str
			end,
		}

		lualine.setup({
			icons_enabled = true,
			options = {
				globalstatus = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "|", right = "" },
			},
			sections = {
				lualine_a = { mode },
			},
		})
	end,
}
