vim.pack.add({ { src = "https://github.com/everviolet/nvim", name = "evergarden" } })
vim.pack.add({ "https://github.com/kvrohit/rasmus.nvim" })

require("evergarden").setup({
    theme = {
        variant = 'winter',
        accent = 'green'
    },
    integrations = {
        fzf_lua = true,
    }
})
--
-- vim.cmd([[colorscheme evergarden]])
--
vim.cmd([[colorscheme rasmus]])
