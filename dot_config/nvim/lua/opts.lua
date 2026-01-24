local o = vim.opt

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
o.backspace = "indent,eol,start"

o.expandtab = true
o.smartindent = true
o.wrap = false
o.autoread = true
o.list = true
o.incsearch = false
o.number = true
o.relativenumber = true
o.conceallevel = 2

o.cmdheight = 1
-- o.messagesopt = "wait:10,history:500"
o.listchars = "tab:> ,nbsp:+"
-- o.clipboard= "unnamed,unnamedplus"
o.signcolumn = "no"
o.termguicolors = true
o.shell = "/bin/fish"
o.completeopt = { "menuone", "noselect", "popup" }
o.laststatus = 0
o.winborder = "rounded"
o.undofile = true
o.smartcase = true
o.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true
})
