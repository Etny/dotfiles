
local builtin = require('telescope.builtin')
local map = vim.api.nvim_set_keymap

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-l>', builtin.live_grep, {})
