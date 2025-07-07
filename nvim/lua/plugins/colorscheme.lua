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
      overrides = function(colors)
        return {
          LineNr = { fg = colors.theme.ui.nontext, bg = "none" },
        }
      end,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oldworld",
    },
  },
}
