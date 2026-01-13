-- disable explorer
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

local opt = vim.opt

-- line numbers
opt.nu = true
opt.relativenumber = true

-- indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

-- backup and undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- search
opt.inccommand = "split"
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.showmode = false
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.termguicolors = true
opt.cursorline = true
opt.background = "dark"

-- window splits
opt.splitright = true
opt.splitbelow = true

-- misc
opt.updatetime = 50
opt.clipboard:append("unnamedplus")
opt.colorcolumn = "80"
opt.guicursor = ""
opt.backspace = {"start", "eol", "indent"}
opt.isfname:append("@-@")
