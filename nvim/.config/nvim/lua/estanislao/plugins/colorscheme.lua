return {
	{
		"blazkowolf/gruber-darker.nvim",
		opts = {
			bold = false,
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = false,
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
		config = function()
			local rose_pine = require("rose-pine")

			rose_pine.setup({
				variant = "main",
				dark_variant = "main",
				disable_background = true,
				disable_nc_background = true,
				disable_float_background = true,
				extend_background_behind_borders = true,
				styles = {
					italic = false,
					bold = true,
					transparency = false, -- TODO: add transparency
				},
				highlight_groups = {
					ColorColumn = { bg = "#1C1C21" },
					Normal = { bg = "none" },
					Pmenu = { bg = "", fg = "#e0def4" },
					PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" },
					PmenuSbar = { bg = "#191724" },
					PmenuThumb = { bg = "#9ccfd8" },
				},
				enable = {
					terminal = false,
					legacy_highlights = false,
					migrations = true,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
