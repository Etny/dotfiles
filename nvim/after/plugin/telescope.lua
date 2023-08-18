require('telescope').setup()

local builtin = require('telescope.builtin')
local map = vim.api.nvim_set_keymap

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-l>', builtin.live_grep, {})

local function open_telescope(data)
    if data.file == "" then
        builtin.find_files()
    elseif vim.fn.isdirectory(data.file) == 1 then
        vim.cmd.cd(data.file)
        builtin.find_files()
    end
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_telescope })
