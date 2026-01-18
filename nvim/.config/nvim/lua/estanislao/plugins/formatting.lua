return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		local conform = require("conform")
		-- local function jsfiles(bufnr) end

		conform.setup({
			default_format_opts = {
				lsp_format = "fallback",
				timeout_ms = 3000,
				async = false,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome", "prettier", stop_after_first = true },
				typescript = { "biome", "prettier", stop_after_first = true },
				javascriptreact = { "biome", "prettier", stop_after_first = true },
				typecriptreact = { "biome", "prettier", stop_after_first = true },
				astro = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				python = { "isort", "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
			},
			formatters = {
				biome = {
					condition = function(self, ctx)
						return vim.fs.fin({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1]
					end,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
				lsp_format = "fallback",
			},
		})
	end,
}
