local map = vim.keymap.set
require("opts")

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tamton-aquib/staline.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/christoomey/vim-tmux-navigator",
    -- LSP & completion
    { src = "https://github.com/saghen/blink.cmp",                version = vim.version.range("1.*") },
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/windwp/nvim-autopairs",
    -- Editor
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/folke/flash.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

})

local lsp = require("lsp")

require("mason").setup()
lsp.setup_lsp()
lsp.setup_treesitter()
lsp.setup_fzf()


require("treesitter-context").setup({
    max_lines = 3,
    multiline_threshold = 1,
    separator = "-",
    min_window_height = 20,
    line_numbers = true,
})

-- Color scheme and statusline
require("colorscheme")
require("staline").setup({
    sections = {
        left = { '  ', 'mode', ' ', 'branch', },
        mid = {},
        right = { 'file_name', 'line_column' }
    },
    mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
    },
    defaults = {
        true_colors = true,
        line_column = " [%l/%L] :%c  ",
        branch_symbol = " "
    }
})
vim.o.laststatus = 3

-- Oil file browser
require("mini.icons").setup()
require("oil").setup({
    columns = { "icon", "size" },
})
map("n", "-", "<CMD>Oil<CR>")

-- Comment lines
require("Comment").setup()
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle comment" })
map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })

-- Move lines up/down
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Move around in tmux
vim.g.tmux_navigator_no_mappings = 1
map("n", "<A-S-k>", "<CMD>TmuxNavigateUp<CR>")
map("n", "<A-S-j>", "<CMD>TmuxNavigateDown<CR>")
map("n", "<A-S-h>", "<CMD>TmuxNavigateLeft<CR>")
map("n", "<A-S-l>", "<CMD>TmuxNavigateRight<CR>")

-- Flash (code navigation)
require("flash").setup()
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump()<CR>")
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter()<CR>")

-- Harpoon (marks and buffers)
local harpoon = require("harpoon")
harpoon:setup()
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map("n", "<leader>h", function() harpoon:list():select(1) end)
map("n", "<leader>j", function() harpoon:list():select(2) end)
map("n", "<leader>k", function() harpoon:list():select(3) end)
map("n", "<leader>l", function() harpoon:list():select(4) end)
