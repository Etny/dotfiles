

return {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = false, silent = true, buffer = bufnr }

        vim.keymap.set({ "n", "i" }, "<C-a>", vim.lsp.buf.code_action, bufopts)

        vim.keymap.set("n", "<Leader>h", 
            function ()
                vim.lsp.buf.hover()
                -- vim.lsp.buf.hover()
            end
        , bufopts)

        vim.keymap.set("i", "<C-i>", "<C-x><C-o>", { noremap = true })

        vim.keymap.set({ "n", "i" }, "<F2>", vim.lsp.buf.rename, bufopts)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<Leader>l", 
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end
            , bufopts)

        vim.keymap.set('n', '<Leader>f', 
            function()
                vim.lsp.buf.format { async = true }
            end
        , bufopts)
    end,

}

