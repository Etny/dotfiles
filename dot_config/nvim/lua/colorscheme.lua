-- vim.pack.add({ { src = "https://github.com/everviolet/nvim", name = "evergarden" } })
vim.pack.add({ "https://github.com/kvrohit/rasmus.nvim" })
vim.pack.add({ "https://github.com/slugbyte/lackluster.nvim" })
vim.pack.add({ "https://github.com/no-clown-fiesta/no-clown-fiesta.nvim" })
vim.pack.add({ "https://github.com/rktjmp/lush.nvim" })

-- require("evergarden").setup({
--     theme = {
--         variant = 'winter',
--         accent = 'green'
--     },
--     integrations = {
--         fzf_lua = true,
--     }
-- })
--
--
vim.cmd("colorscheme rasmus")

local lush = require('lush')
local hsl = lush.hsl

local darkfg = hsl(220, 8, 85)
local darkkw = hsl(190, 30, 30)
local darksl = hsl(180, 4, 4)
local darkhl = hsl(60, 40, 37)


-- Comment
local theme = lush(function()
    return {
        Normal { bg = darksl, fg =  darkfg },
        Keyword { Normal, fg = darkkw },
        Comment { Normal, fg = Normal.fg.darken(50), gui = 'italic' },
        Visual {  bg = Normal.bg.li(16).sa(-10) }

    }
end)

return theme
