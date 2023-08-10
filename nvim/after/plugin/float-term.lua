
local map = vim.api.nvim_set_keymap

map('n', "<Leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclise=3 fish <CR>", {})
map('n', "t", ":FloatermToggle myfloat<CR>", {})
map('t', "<Esc>", "<C-\\><C-n>:q<CR>", {})
