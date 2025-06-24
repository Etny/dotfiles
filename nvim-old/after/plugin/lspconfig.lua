local lc = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

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
            diagnostics = {
                enable = true,
                disabled = {"unresolved-proc-macro"}
            }
        },
    },
    capabilities = capabilities,
}
lc.ts_ls.setup {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
          languages = {"javascript", "typescript", "vue"},
        },
      },
    },
    filetypes = {
      "javascript",
      "typescript",
      "vue",
    },
    capabilities = capabilities
}

local servers = {'cssls', 'glsl_analyzer', 'zls', 'texlab', 'html', 'volar', 'hls'}
for _, server in ipairs(servers) do
    lc[server].setup {
        capabilities = capabilities
    }
end

lc.asm_lsp.setup {
    single_file_support = true,
    filetypes = { "asm", "s", "S" }
}

require('glslView').setup {
  viewer_path = 'glslViewer',
  args = { '-l' },
}

require('lsp_signature').setup({

})

local bindings = require('lspbindings')

vim.api.nvim_create_autocmd('LspAttach', bindings)
