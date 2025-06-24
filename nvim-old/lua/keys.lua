local mapper = require("nvim-mapper")
local group = require("bindgroup")

-- Set Leader
vim.keymap.set('', '<Space>', '<Nop>')
vim.g.mapleader = " "

-- Hop
local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
mapper.map('', '<C-h>', function() hop.hint_patterns() end, { remap = true }, "Hop", "hop",
    "Activate Hop plugin to quickly jump to on-screen text")

-- File Explorer
local nvim_tree = require('nvim-tree.api');
mapper.map('', '<C-f>', nvim_tree.tree.toggle, { remap = true }, "Tree", "tree_open", "Open nvim-tree file browser")

-- Tagbar
mapper.map('', '<C-t>', ':TagbarToggle<CR>', {}, "Tagbar", "tb_toggle", "Toggle the tagbar")

-- Comments
mapper.map('', '<C-c>', 'gcc', { remap = true }, "Editor", "lsp_comment_line", "Comment- or uncomment the current line")
mapper.map('v', '<C-c>', 'gc', { remap = true }, "Editor", "lsp_comment_lock", "Comment- or uncomment the current block")

-- Move between windows
group.map({ category = "General", mode = '', options = {} }, {
    { '<A-h>', '<C-w>h', "ui_move_left",  "Move a window to the left" },
    { '<A-l>', '<C-w>l', "ui_move_right", "Move a window to the right" },
    { '<A-j>', '<C-w>j', "ui_move_down",  "Move a window down" },
    { '<A-k>', '<C-w>k', "ui_move_up",    "Move a window up" },
})
-- Move lines
mapper.map('', '<A-Up>', 'ddkkp', {}, "Editor", "move_line_up", "Move the currenty line up")
mapper.map('', '<A-Down>', 'ddp', {}, "Editor", "move_line_down", "Move the current line down")

-- Quick newline in insert
mapper.map('i', '<S-CR>', '<C-o>o', {}, "Editor", "insert_newline", "Insert a newline in insert mode")

-- Completion shortcut
mapper.map('i', '<C-i>', '<C-x><C-o>', {}, "Editor", "lsp_open_completion", "Open code completion menu in insert mode")


group.map({ category = "Vimspector", options = {}, mode = 'n' }, {
    { "Db", ":call vimspector#ToggleBreakpoint()<cr>", "toggle_bp", "Toggle breakpoint on current line" },
    { "Dw", ":call vimspector#AddWatch()<cr>",         "add_watch", "Add a watch (?)" },
    { "De", ":call vimspector#Evaluate()<cr>",         "evaluate",  "Evaluate" }
})


group.map({ category = "Barbar", options = { noremap = true, silent = true }, mode = 'n' }, {
    -- Move to previous/next
    { '<A-,>',      '<Cmd>BufferPrevious<CR>',            "bb_goto_prev", "Go to previous tab" },
    { '<A-.>',      '<Cmd>BufferNext<CR>',                "bb_goto_next", "Go to next tab" },
    -- Re-order to previous/next
    { '<A-S-,>',    '<Cmd>BufferMovePrevious<CR>',        "bb_move_prev", "Move tab to previous" },
    { '<A-S-.>',    '<Cmd>BufferMoveNext<CR>',            "bb_move_next", "Move tab to next" },
    -- Goto buffer in position...
    { '<A-1>',      '<Cmd>BufferGoto 1<CR>',              "bb_goto_1",    "Go to tab 1" },
    { '<A-2>',      '<Cmd>BufferGoto 2<CR>',              "bb_goto_2",    "Go to tab 2" },
    { '<A-3>',      '<Cmd>BufferGoto 3<CR>',              "bb_goto_3",    "Go to tab 3" },
    { '<A-4>',      '<Cmd>BufferGoto 4<CR>',              "bb_goto_4",    "Go to tab 4" },
    { '<A-5>',      '<Cmd>BufferGoto 5<CR>',              "bb_goto_5",    "Go to tab 5" },
    { '<A-6>',      '<Cmd>BufferGoto 6<CR>',              "bb_goto_6",    "Go to tab 6" },
    { '<A-7>',      '<Cmd>BufferGoto 7<CR>',              "bb_goto_7",    "Go to tab 7" },
    { '<A-8>',      '<Cmd>BufferGoto 8<CR>',              "bb_goto_8",    "Go to tab 8" },
    { '<A-9>',      '<Cmd>BufferGoto 9<CR>',              "bb_goto_9",    "Go to tab 9" },
    { '<A-0>',      '<Cmd>BufferLast<CR>',                "bb_goto_last", "Go to last tab" },
    -- Pin/unpin buffer
    { '<A-p>',      '<Cmd>BufferPin<CR>',                 "bb_pin",       "Pin tab" },
    -- Close buffer
    { '<A-c>',      '<Cmd>BufferClose<CR>',               "bb_close",     "Closse tab" },
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    { '<C-p>',      '<Cmd>BufferPick<CR>',                "bb_pick",      "Buffer picking mode" },
    -- Sort automatically by...
    { '<Leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', "bb_sort_num",  "Sort tabs by buffer number" },
    { '<Leader>bd', '<Cmd>BufferOrderByDirectory<CR>',    "bb_sort_dir",  "Sort tabs by directory" },
    { '<Leader>bl', '<Cmd>BufferOrderByLanguage<CR>',     "bb_sort_lang", "Sort tabs by language" },
    { '<Leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', "bb_sort_win",  "Sort tabs by window number" },
})

group.map({ category = "FloatTerm", options = {} }, {
    { 'n', "<Leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclise=3 fish <CR>", "ft_new",   "Open new FloatTerm" },
    { 'n', "t",          ":FloatermToggle myfloat<CR>",                                                  "ft_open",  "Open FloatTerm" },
    { 't', "<Esc>",      "<C-\\><C-n>:q<CR>",                                                            "ft_close", "Close FloatTerm" },
});


local telescope_builtin = require('telescope.builtin')
group.map({ category = "Telescope", options = {}, mode = 'n' }, {
    { '<C-p>',   telescope_builtin.find_files, "telescope_files",  "Open Telescope find files menu" },
    { '<C-l>',   telescope_builtin.live_grep,  "telescope_grep",   "Open Telescope live grep menu" },
    { '<C-S-p>', ":Telescope mapper<CR>",      "telescope_mapper", "Open Telescope mapper menu" },
})

-- These bindings are defined in lspbindings.lua!
group.map_virt({ keys = "", category = "LSP", options = {} }, {
    { { "n", "i" }, "<C-a>",     "lsp_code_action",    "Open code action menu" },
    { "n",          "<A-h>",     "lsp_hover",          "Open \'hover\' menu" },
    { "n",          "F2",        "lsp_rename",         "Open rename dialog" },
    { "n",          "<Leader>l", "lsp_list_workspace", "Prints workspace folder" },
    { "n",          "<Leader>f", "lsp_format",         "Format buffer" }
})

-- These bindings are defined in after/comp.lua!
group.map_virt({ keys = "", category = "LSP", options = {}, mode = "" }, {
    { "<C-k>", "lsp_suggest_next", "Select next item in autocomplete menu" },
    { "<C-j>", "lsp_suggest_prev", "Select previous item in autocomplete menu" },
    { "<C-f>", "lsp_scroll_docs",  "Scroll documentation in autocomplete menu" },
})
