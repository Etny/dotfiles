return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "tree-sitter/tree-sitter-typescript"
    },
    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local cap = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("lsp_signature").setup({})
        -- require("tree-sitter/tree-sitter-typescript").tsx.setup({})
        -- require("virtualtypes").on_attach()

        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "clangd",
                "cssls",
                "html",
                "vue_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = cap
                    })
                end,
            }
        })
        require("lspconfig").rust_analyzer.setup {
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
                        disabled = { "unresolved-proc-macro" }
                    }
                },
            },
            capabilities = cap,
        }


        require("lspconfig").ts_ls.setup {
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                        languages = { "javascript", "typescript", "vue" },
                    },
                },
            },
            filetypes = {
                "javascript",
                "typescript",
                "vue",
            },
            capabilities = cap
        }

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = {
                { name = 'path' },                    -- file paths
                { name = 'nvim_lsp' },                -- from language server
                { name = 'nvim_lsp_signature_help' }, -- display function signatures with current parameter emphasized
                { name = 'nvim_lua' },                -- complete neovim's Lua runtime API such vim.lsp.*
                -- { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
                { name = 'luasnip',                keyword_length = 2 },
                { name = 'buffer',                 keyword_length = 3 }, -- source current buffer
                { name = 'calc' },                                       -- source for math calculation
            },
            mapping = cmp.mapping.preset.insert({
                ['<A-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<A-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Leader>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' })
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            }
        })
    end
}
