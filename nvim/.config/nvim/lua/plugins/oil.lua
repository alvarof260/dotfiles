return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "icon",
    },
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
    ["<C-d>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-r>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
    -- Window navigation without conflicts
    ["<C-h>"] = function()
      vim.cmd("wincmd h")
    end,
    ["<C-j>"] = function()
      vim.cmd("wincmd j")
    end,
    ["<C-k>"] = function()
      vim.cmd("wincmd k")
    end,
    ["<C-l>"] = function()
      vim.cmd("wincmd l")
    end,
    -- Quick quit
    ["q"] = "actions.close",
  },
  -- Optional dependencies
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
