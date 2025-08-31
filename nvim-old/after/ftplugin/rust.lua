local buf = vim.api.nvim_get_current_buf()
local wk = require('which-key')
local opts = { buffer = buf, }

vim.keymap.set(
    "n",
    "<leader>la",
    function()
        vim.cmd.RustLsp('codeAction')
    end,
    { silent = true, buffer = buf }
)

local mappings = {
    { "K",          function() vim.cmd.RustLsp({ 'hover', 'actions' }) end, desc = "Show hover info" },
    { "<leader>le", function() vim.cmd.RustLsp('explainError') end,         desc = "Explain error" },
    { "<leader>la", function() vim.cmd.RustLsp('codeAction') end,           desc = "Rust code action" },
    { "<leader>ld", function() vim.cmd.RustLsp('openDocs') end,             desc = "Open doc.rs" },
    { "<leader>lc", function() vim.cmd.RustLsp('openCargo') end,            desc = "Open Cargo.toml" },
    { "<A-r>",      function() vim.cmd.RustLsp('run') end,                  desc = "Run" },
}

wk.add(mappings, opts)
