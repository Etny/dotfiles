
vim.cmd([[
au! BufEnter *.c(pp)? let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = '../inc,.'
]])

vim.keymap.set('n', '<Leader>h', ':FSSplitRight<CR>')
