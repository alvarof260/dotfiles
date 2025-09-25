return {
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

  {
    "miikanissi/modus-themes.nvim",
    name = "modus",
    priority = 1000,
  },

  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dragon",
    },
  },

  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
