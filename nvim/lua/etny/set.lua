vim.cmd.colorscheme("onedark")

vim.opt.clipboard = "unnamedplus" -- use system clipboard as default

vim.opt.number = true             -- enable line numbers
vim.opt.relativenumber = true     -- and make them relative

-- set tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.notify = require("notify")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
