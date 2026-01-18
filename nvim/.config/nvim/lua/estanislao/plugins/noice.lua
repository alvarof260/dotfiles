return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local noice = require("noice")

		noice.setup({})

		vim.keymap.set("c", "<S-Enter>", function()
			require("noice").redirect(vim.fn.getcmdline())
		end, { desc = "Redirect Cmdline" })

		-- Comandos de Noice
		vim.keymap.set("n", "<leader>snl", function()
			require("noice").cmd("last")
		end, { desc = "Noice Last Message" })
		vim.keymap.set("n", "<leader>snh", function()
			require("noice").cmd("history")
		end, { desc = "Noice History" })
		vim.keymap.set("n", "<leader>sna", function()
			require("noice").cmd("all")
		end, { desc = "Noice All" })
		vim.keymap.set("n", "<leader>snd", function()
			require("noice").cmd("dismiss")
		end, { desc = "Dismiss All" })
		vim.keymap.set("n", "<leader>snt", function()
			require("noice").cmd("pick")
		end, { desc = "Noice Picker" })

		vim.keymap.set({ "i", "n", "s" }, "<c-f>", function()
			if not require("noice.lsp").scroll(4) then
				return "<c-f>"
			end
		end, { silent = true, expr = true, desc = "Scroll Forward" })

		vim.keymap.set({ "i", "n", "s" }, "<c-b>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-b>"
			end
		end, { silent = true, expr = true, desc = "Scroll Backward" })
	end,
}
