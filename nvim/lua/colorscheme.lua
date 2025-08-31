vim.pack.add({ { src = "https://github.com/everviolet/nvim", name = "evergarden" } })

require("evergarden").setup({
    theme = {
        variant = 'winter',
        accent = 'green'
    },
    integrations = {
        fzf_lua = true,
    }
})

vim.cmd([[colorscheme evergarden]])
