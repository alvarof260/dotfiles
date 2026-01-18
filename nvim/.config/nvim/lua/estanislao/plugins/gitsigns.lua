return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitSigns = require("gitsigns")

		gitSigns.setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
				end

				-- navigation
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, "Next hunk")

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, "Prev hunk")

				map("n", "]H", function()
					gs.nav_hunk("last")
				end, "Last hunk")
				map("n", "[H", function()
					gs.nav_hunk("first")
				end, "First hunk")

				-- actions
				map({ "n", "x" }, "<leader>ghs", gs.stage_hunk, "Stage hunk")
				map({ "n", "x" }, "<leader>ghr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage buffer")
				map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>ghb", gs.toggle_current_line_blame, "Toggle blame line")
				map("n", "<leader>ghB", function()
					gs.blame()
				end, "Blame buffer")
				map("n", "<leader>ghd", gs.diffthis, "Diff this")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns select hunk")
			end,
		})
	end,
}
