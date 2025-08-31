local ill = require('illuminate');

ill.configure({
    providers = {
        'lsp',
        'treesitter',
        'regex'
    },
    under_cursor = true
})

vim.api.nvim_exec([[
hi def IlluminatedWordText guibg=red
]], false)


