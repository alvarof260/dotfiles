vim.api.nvim_create_autocmd({"BufEnter" , "BufWinEnter"}, {
    callback = function()
        vim.opt_local.textwidth = 80
        vim.opt_local.formatoptions:append("t")
        vim.opt_local.smartindent = false
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup(
        "kickstart-highlight-yank", 
        { clear = true }
    ),
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})
