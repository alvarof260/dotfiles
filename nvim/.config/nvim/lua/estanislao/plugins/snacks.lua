return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			indent = {
				enabled = true,
			},
			picker = {
				enabled = true,
				sources = {
					files = { hidden = true },
					grep = { hidden = true },
					explorer = { hidden = true },
				},
				exclude = {
					".git",
					"node_modules",
					"dist",
					"build",
				},
				layout = {
					preset = "telescope",
					cycle = false,
				},
				--TODO: edit UI PICKER
			},
			input = {
				enabled = true,
			},
			image = {
				enabled = true,
			},
			dashboard = {
				enabled = true,
				sections = {
					{
						section = "header",
					},
					{
						icon = " ",
						title = "Keymaps",
						section = "keys",
						indent = 2,
						padding = 1,
					},
					{
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{
						icon = " ",
						title = "Projects",
						section = "projects",
						indent = 2,
						padding = 1,
					},
					{
						section = "startup",
					},
				},
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					require("snacks").explorer()
				end,
				desc = "File explorer",
			},
			{
				"<leader>cR",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Rename current file",
			},

			-- Buffers
			{
				"<leader>bd",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete buffer",
			},
			{
				"<leader>bo",
				function()
					require("snacks").bufdelete.other()
				end,
				desc = "Delete other buffers",
			},

			-- Git
			{
				"<leader>gl",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gg",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit logs",
			},
			{
				"<leader>gb",
				function()
					require("snacks").git.blame_line()
				end,
				desc = "Blame line",
			},
			{
				"<leader>gf",
				function()
					require("snacks").picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			{
				"<leader>gB",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Git branches",
			},

			-- Find
			{
				"<leader><space>",
				function()
					require("snacks").picker.smart()
				end,
				desc = "Smart find Files",
			},
			{
				"<leader>fb",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("snacks").picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fp",
				function()
					require("snacks").picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>fr",
				function()
					require("snacks").picker.recent()
				end,
				desc = "Recent",
			},

			-- grep
			{
				"<leader>sb",
				function()
					require("snacks").picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					require("snacks").picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},

			-- other utils
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "ivy" })
				end,
				desc = "Search keymaps",
			},
			{
				"<leader>pc",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick colorschemes",
			},
			{
				"<leader>ph",
				function()
					require("snacks").picker.help({ layout = "ivy" })
				end,
				desc = "Help pages",
			},
			{
				"<leader>pm",
				function()
					require("snacks").picker.man({ layout = "ivy" })
				end,
				desc = "Man pages",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
}
