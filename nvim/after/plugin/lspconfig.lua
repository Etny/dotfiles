
local lc = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lc.clangd.setup {
    capabilities = capabilities
}
lc.lua_ls.setup {}
lc.rust_analyzer.setup {
    flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      completion = {
	postfix = {
	  enable = false,
	},
      },
    },
  },
  capabilities = capabilities,
}
lc.asm_lsp.setup {
    single_file_support = true,
    filetypes = {"asm", "s", "S"}
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=false, silent=true, buffer=bufnr }
    vim.keymap.set({"n", "i"}, "<C-a>", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, bufopts)
    vim.keymap.set({"n", "i"}, "<F2>", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
  end,
})
