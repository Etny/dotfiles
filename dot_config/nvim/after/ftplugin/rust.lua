local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set(
    "n",
    "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set(
    "n",
    "<leader>K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp('explainError')
    end,
    { silent = true, buffer = bufnr }
)
vim.keymap.set(
    "n", "<F5>",
    function()
        vim.cmd.RustLsp('run')
    end,
    { silent = true, buffer = bufnr }
)


vim.g.VimuxCloseOnExit = 1
vim.g.VimuxUseNearest = 0
vim.g.VimuxHeight = "30%"
vim.g.VimuxOrientation = "h"
