local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function (ev)
        local function map(mode, l, r, desc)
            vim.keymap.set(
                mode,
                l,
                r,
                { buffer = ev.buf, desc = desc, silent = true }
            )
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gr", function () Snacks.picker.lsp_references() end, "Show references (picker)")
        map("n", "gI", function() Snacks.picker.lsp_implementations() end, "Go to implementation")
        map("n", "gy", function () Snacks.picker.lsp_type_definitions() end, "")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>cR", function () Snacks.rename.rename_file() end, "Rename file")
        map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>cdb", function() Snacks.picker.diagnostics_buffer() end, "Show buffer diagnostics")
        map("n", "<leader>cdl",  vim.diagnostic.open_float, "Show line diagnostics")
        map("n", "<leader>ci",  ":LspInfo<CR>", "Lsp info")
        map("n", "<leader>cx",  ":LspRestart<CR>", "Lsp restart")
        -- map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
        map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous diagnostic")
    end
})
