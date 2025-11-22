return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = { -- table/string: additional groups that should be cleared
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",
        },
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end,
  },
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- {
  --  "zootedb0t/citruszest.nvim",
  --  lazy = false,
  --  priority = 1000,
  -- },

  -- {
  -- "Everblush/nvim",
  --  name = "everblush",
  -- },

  -- {
  --   "miikanissi/modus-themes.nvim",
  --   name = "modus",
  --   priority = 1000,
  -- },
  --
  -- {
  --   "dgox16/oldworld.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },
  --
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     theme = "dragon",
  --   },
  -- },
  --
  -- -- lua/plugins/rose-pine.lua
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   styles = {
  --     transparency = true,
  --   },
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      theme = "macchiato",
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
