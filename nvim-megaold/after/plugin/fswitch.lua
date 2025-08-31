
vim.cmd([[
au! BufEnter *.c(pp)? let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = '../inc,.'
]])

local mapper = require('nvim-mapper')
mapper.map('n', '<Leader>s', ':FSSplitRight<CR>', {}, "FSwitch", "fs_switch", "Split into companion file on the right")
