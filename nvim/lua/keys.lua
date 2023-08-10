

-- Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<C-h>', function()
    hop.hint_patterns()
end, {remap=true})

-- File Explorer
local nvim_tree = require('nvim-tree.api');
vim.keymap.set('', '<C-f>', nvim_tree.tree.toggle, {remap=true})

-- Tagbar
vim.keymap.set('', '<C-t>', ':TagbarToggle<CR>', {})

-- Comments
vim.keymap.set('', '<A-c>', 'gcc', {remap=true})
vim.keymap.set('v', '<A-c>', 'gc', {remap=true})

-- Move between windows
vim.keymap.set('', '<A-h>', '<C-w>h', {})
vim.keymap.set('', '<A-l>', '<C-w>l', {})
vim.keymap.set('', '<A-j>', '<C-w>j', {})
vim.keymap.set('', '<A-k>', '<C-w>k', {})

-- Move lines
vim.keymap.set('', '<A-Up>', 'ddkkp', {})
vim.keymap.set('', '<A-Down>', 'ddp', {})


