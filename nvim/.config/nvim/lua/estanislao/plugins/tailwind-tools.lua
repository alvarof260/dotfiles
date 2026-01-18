return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		config = function()
			local colorizer = require("colorizer")
			local tailwindColorizer = require("tailwindcss-colorizer-cmp")

			colorizer.setup({
				user_default_options = {
					tailwind = true,
				},
				filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx", "vue", "angular", "svelte" },
			})
			tailwindColorizer.setup({
				color_square_width = 2,
			})
		end,
	},
}
