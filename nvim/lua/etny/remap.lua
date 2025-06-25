local wk = require("which-key")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        local mappings = {
            { "gd",         vim.lsp.buf.definition,       desc = "Go to definition" },
            { "gl",         vim.diagnostic.open_float,    desc = "Open diagnostic float" },
            { "K",          vim.lsp.buf.hover,            desc = "Show hover info" },
            { "<leader>l",  group = "LSP" },
            { "<leader>la", vim.lsp.buf.code_action,      desc = "Code action" },
            { "<leader>lr", vim.lsp.buf.references,       desc = "References" },
            { "<leader>ln", vim.lsp.buf.rename,           desc = "Rename" },
            { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbol" },
            { "<leader>lf", vim.lsp.buf.format,           desc = "Format file" },
            { "[d",         vim.diagnostic.goto_next,     desc = "Go to next diagnostic" },
            { "]d",         vim.diagnostic.goto_prev,     desc = "Go to previous diagnostic" },
        }

        wk.add(mappings, opts)

        require("virtualtypes").on_attach()

        -- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
        vim.api.nvim_create_autocmd("FileWritePre", {
            buffer = event.buf,
            callback = function()
                vim.lsp.buf.format({ async = false, id = event.data.client_id })
            end
        })
    end
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        if data.file == "" then
            require("nvim-tree.api").tree.open()
        elseif vim.fn.isdirectory(data.file) == 1 then
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
        end
    end
})

local non_lsp_mappings = {
    { "<leader>e", require('nvim-tree.api').tree.toggle,      desc = "Open file explorer" },
    { "<leader>p", "\"_dP",                                   desc = "Paste without overwriting" },
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle comment" },
    -- { "<A-j>",     ":m '>+1<CR>",                             desc = "Move line down" },
    -- { "<A-k>",     ":m '<-2<CR>",                             desc = "Move line up" },
    { "J",         "mzJ`z",                                   desc = "Join lines an keep cursor pos" },
    { "<C-d>",     "<C-d>zz",                                 desc = "Half page down and center" },
    { "<C-u>",     "<C-u>zz",                                 desc = "Half page up and center" },
    { "n",         "nzzzv",                                   desc = "Next search result and center" },
    { "N",         "Nzzzv",                                   desc = "Previous search result and center" },
    { "Q",         "<nop>",                                   desc = "Disable Ex mode (???)" },
    { "t",         ":FloatermToggle <CR>",                    desc = "Open floaterm" },
    { "<Esc>",     "<C-\\><C-n>:q<CR>",                       mode = "t" },
}



wk.add(non_lsp_mappings)

local builtin = require("telescope.builtin")
local telescope_mappings = {
    { "<leader>f",  group = "Find" },
    { "<leader>ff", builtin.find_files, desc = "Find files" },
    { "<leader>fg", builtin.git_files,  desc = "Git files" },
    { "<leader>fl", builtin.live_grep,  desc = "Live grep" },
}

wk.add(telescope_mappings)

wk.add({
    { ',', builtin.buffers, desc = "Find buffers" }
})

local visual_mappings = {
    { "J",         ":m '>+1<CR>gv=gv",                       mode = "v", desc = "Move selection down" },
    { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", mode = "v", desc = "Toggle comment" },
    { "K",         ":m '<-2<CR>gv=gv",                       mode = "v", desc = "Move selection up" }, }

wk.add(visual_mappings)

vim.keymap.set('i', "<Right>", "<Right>", { noremap = true }) --fix right arrow in insert mode
