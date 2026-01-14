vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set(
    "v",
    "J",
    ":m '>+1<CR>gv=gv",
    { desc = "Moves lines down in visual selection" }
)
vim.keymap.set(
    "v",
    "K",
    ":m '<-2<CR>gv=gv",
    { desc ="Moves lines up in visual selection" }
)
vim.keymap.set(
    "n",
    "J",
    "mzJ`z",
    { desc = "Join lines keeping cursor position" }
)
vim.keymap.set(
    "n",
    "<C-d>",
    "<C-d>zz",
    { desc = "Scroll down and center screen" }
)
vim.keymap.set(
    "n",
    "<C-u>",
    "<C-u>zz",
    { desc = "Scroll up and center screen" }
)
vim.keymap.set(
    "n",
    "n",
    "nzzzv",
    { desc = "Next search result centered" }
)
vim.keymap.set(
    "n",
    "N",
    "Nzzzv",
    { desc = "Previous search result centered" }
)

vim.keymap.set(
    "x",
    "<leader>p",
    "\"_dP",
    { desc = [[Paste without overwriting register]] }
)

vim.keymap.set(
    "n",
    "<leader>y",
    "\"+y", { desc = "Yank to system clipboard" }
)
vim.keymap.set(
    "v",
    "<leader>y",
    "\"+y", { desc = "Yank to system clipboard" }
)
vim.keymap.set(
    "n",
    "<leader>Y",
    "\"+Y",
    { desc = "Yank line to system clipboard" }
)

vim.keymap.set(
    "n",
    "<leader>d",
    "\"_d",
    { desc = "Delete into black hole register" }
)
vim.keymap.set(
    "v",
    "<leader>d",
    "\"_d",
    { desc = "Delete into black hole register" }
)

-- Quickfix List
vim.keymap.set(
    "n",
    "<C-k>",
    "<cmd>cnext<CR>zz",
    { desc = "Next quickfix item" }
)
vim.keymap.set(
    "n",
    "<C-j>",
    "<cmd>cprev<CR>zz",
    { desc = "Prev quickfix item" }
)

-- Location List
vim.keymap.set(
    "n",
    "<leader>k",
    "<cmd>lnext<CR>zz",
    { desc = "Next location list item" }
)
vim.keymap.set(
    "n",
    "<leader>j",
    "<cmd>lprev<CR>zz",
    { desc = "Prev location list item" }
)

vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" }
)
vim.keymap.set(
    "n",
    "<leader>x",
    "<cmd>!chmod +x %<CR>",
    {silent = true, desc = "Makes file executable"}
)

vim.keymap.set(
    "n",
    "<Esc>",
    "<cmd>nohl<CR>",
    {desc = "Clear search hl", silent = true}
)

vim.keymap.set(
    "n",
    "<C-s>",
    "<cmd>w<CR>"
)
