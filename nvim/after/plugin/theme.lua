-- Monokai
--[[ require('monokai').setup {}
require('monokai').setup { palette = require('monokai').pro }
require('monokai').setup { palette = require('monokai').soda }
require('monokai').setup { palette = require('monokai').ristretto } ]]

-- gruvbox

require('gruvbox').setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
        Normal = { bg = "#292522"}
    },
  dim_inactive = false,
  transparent_mode = false,
})

 -- Kanagawa
require('kanagawa').setup({
    background = {
        dark = "dragon"
    }
})

-- gruvbox-baby
-- require('gruvbox-baby')
vim.g.gruvbox_baby_keyword_style = "bold"
-- vim.g.gruvbox_baby_transparent_mode = "true"
-- vim.g.gruvbox_baby_variable_style = "italic"


vim.o.background = "dark"
vim.opt.termguicolors = true
vim.cmd.colorscheme 'gruvbox-baby'
