return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					java = false,
				},
			})
		end,
	},
	--FIX: no funciona el autocompletado de tags
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			local nvim_ts_autotag = require("nvim-ts-autotag")

			nvim_ts_autotag.setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
