return {
	"nvim-lua/plenary.nvim",
	"alexghergh/nvim-tmux-navigation",
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{
					path = "${3rd}/plenary.nvim/lua",
					words = { "plenary" },
				},
			},
		},
	},
}
