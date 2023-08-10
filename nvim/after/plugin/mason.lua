local mason = require('mason')

mason.setup();

require('mason-lspconfig').setup {
    ensure_installed = {
        'clangd',
        'asm_lsp',
        'lua_ls'
    }
}
