local map = vim.keymap.set
require("opts")
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/tamton-aquib/staline.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/preservim/vimux",
    -- LSP & completion
    { src = "https://github.com/saghen/blink.cmp",                version = vim.version.range("1.*") },
    { src = "https://github.com/L3MON4D3/LuaSnip",                version = "v2.4.0" },
    -- "https://github.com/OmniSharp/omnisharp-vim",
    -- "https://github.com/ethanuppal/spade.nvim",
    "https://github.com/mrcjkb/rustaceanvim",
    -- "https://gitlab.com/spade-lang/spade-vim",
    "https://github.com/vim-pandoc/vim-pandoc",
    "https://github.com/vim-pandoc/vim-pandoc-syntax",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/iurimateus/luasnip-latex-snippets.nvim",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/lervag/vimtex",
    -- Editor
    "https://github.com/numToStr/Comment.nvim",
    "https://github.com/folke/flash.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("lsp")



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

-- Oil file browser
require("mini.icons").setup()
require("oil").setup({
    columns = { "icon", "size" },
})
map("n", "-", "<CMD>Oil<CR>")

-- LSP
map("n", "<leader>K", function() vim.diagnostic.open_float() end)
map("n", "<leader>a", function() vim.lsp.buf.code_action() end)
map("n", "<F2>", function() vim.lsp.buf.rename() end)
map("n", "<leader>d", vim.lsp.buf.definition, bufopts)
map("n", "<leader>r", vim.lsp.buf.references, bufopts)
map("n", "<leader>t", vim.lsp.buf.type_definition, bufopts)
map("n", "<leader>T", vim.lsp.buf.type_definition, bufopts)

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
require("flash").setup({
    label = { uppercase = false },
    highlight = { backdrop = false },
    modes = { char = { enabled = false } }
})
map({ "n", "x", "o" }, "s", "<CMD>lua require('flash').jump()<CR>")
map({ "n", "x", "o" }, "S", "<CMD>lua require('flash').treesitter()<CR>")

-- Harpoon (marks and buffers)
local harpoon = require("harpoon")
harpoon:setup()
map("n", "<leader>A", function() harpoon:list():add() end)
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map("n", "<leader>c", function() harpoon:list():clear() end)
map("n", "<A-Left>", function() harpoon:list():prev() end)
map("n", "<A-Right>", function() harpoon:list():next() end)
map("n", "<leader>h", function() harpoon:list():select(1) end)
map("n", "<leader>j", function() harpoon:list():select(2) end)
map("n", "<leader>k", function() harpoon:list():select(3) end)
map("n", "<leader>l", function() harpoon:list():select(4) end)

-- Pandoc compile and export
map("n", "<leader><C-P>", function()
    local path = vim.fn.fnameescape(vim.fn.expand("%:p:h"))
    local file = vim.fn.fnameescape(vim.fn.expand("%:t:p"))
    local pdf_name = vim.fn.fnameescape(vim.fn.expand("%:t:r")) .. ".pdf"
    vim.cmd("silent !mkdir -p " .. path .. "/pdfs")
    vim.cmd("!pandoc -o " .. path .. "/pdfs/" .. pdf_name .. " " .. file)
    print("Created " .. pdf_name)
end)

map("n", "<leader><A-P>", function()
    local path = vim.fn.fnameescape(vim.fn.expand("%:p:h"))
    local pdf_name = vim.fn.fnameescape(vim.fn.expand("%:t:r")) .. ".pdf"
    local pdf_path = path .. "/pdfs/" .. pdf_name
    vim.cmd("!cp " .. pdf_path .. " ~/paperless/")
    print("Copied " .. pdf_name)
end)
