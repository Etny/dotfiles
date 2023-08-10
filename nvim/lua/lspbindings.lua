

return 
{
    on_attach = function(_, bufnr) 
        local bufopts = { noremap=false, silent=true, buffer=bufnr }
        vim.keymap.set({"n", "i"}, "<C-a>", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, bufopts)
        vim.keymap.set({"n", "i"}, "<F2>", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, bufopts)
    end
}
