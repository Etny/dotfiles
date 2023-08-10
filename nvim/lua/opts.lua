
local opt = vim.opt
opt.completeopt = {'menuone', 'noselect', 'noinsert'}
opt.shortmess = opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- [[ Context ]]
-- opt.colorcolumn = '80'
opt.number = true
opt.signcolumn = "yes"

-- [[ Filetypes ]]
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- Undo
opt.undodir="~/.vimdid"
opt.undofile = true

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true

-- [[ Search ]]
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- [[ Splits ]]
opt.splitright = true
opt.splitbelow = true
