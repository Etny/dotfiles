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
    filetypes = { "asm", "s", "S" }
}

local bindings = require('lspbindings')

vim.api.nvim_create_autocmd('LspAttach', bindings)
