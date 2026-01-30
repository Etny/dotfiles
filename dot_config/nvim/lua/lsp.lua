local augroup = vim.api.nvim_create_augroup("etny.cfg", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local map = vim.keymap.set

local setup = function()
    require("luasnip-latex-snippets").setup()
    local ls = require("luasnip")
    ls.setup({ enable_autosnippets = true })
    -- ls.filetype_set("pandoc", { "markdown", "tex" })
    require("luasnip.loaders.from_vscode").lazy_load {
        exclude = { "tex" },
    }
    -- require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    require("blink.cmp").setup({
        -- snippets = { preset = "luasnip" },
        keymap = {
            preset = 'default',
            ['<A-k>'] = { 'select_prev', 'fallback' },
            ['<A-j>'] = { 'select_next', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },

            ['<A-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<A-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<A-g>'] = { 'show_signature', 'hide_signature', 'fallback' },

        },
        sources = {
            per_filetype = {
                pandoc = { 'snippets' },
                tex = { 'snippets', 'lsp' }
            }
        },
        completion = {
            menu = {
                enabled = true,
                border = nil,
                direction_priority = { 's', 'n' },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
            }
        },
        fuzzy = {
            implementation = 'rust',
            max_typos = function(keyword) return 0 end,
        },
        signature = { enabled = true }
    })





    vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "vue_ls",
        "marksman",
        "clangd",
        -- "csharp_ls",
        "vhdl_ls",
        -- "ltex"
    })



    autocmd("LspAttach", {
        group = augroup,
        callback = function(ev)
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }


            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            -- I FUCKING HATE OMNISHARP!!!
            -- If we don't do this it will:
            --      1) Fuck up syntax hightlighting
            --      2) Spam an error in the log every time
            --         we scroll, filling disk. WHY???
            if client.name == "omnisharp" then
                client.server_capabilities.semanticTokensProvider = nil
            end


            -- Using blink.cpm instead
            -- map("i", "<C-k>", vim.lsp.completion.get, bufopts)
            -- local methods = vim.lsp.protocol.Methods
            -- if client:supports_method(methods.textDocument_completion) then
            --       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            -- end

            -- Format buffer on save
            autocmd("BufWritePre", {
                group = augroup,
                buffer = ev.buffer,
                callback = function()
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client == nill then return end
                    local methods = vim.lsp.protocol.Methods
                    if client:supports_method(methods.textDocument_formatting) then
                        vim.lsp.buf.format({ async = false, id = ev.data.client_id })
                    end
                end
            })
        end
    })


    vim.g.rustaceanvim = {
        tools = {
            executor = require("rustaceanvim.executors").vimux,
        },
        server = {
            on_attach = function(client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
            end
        }

    }



    vim.cmd([[
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
filetype plugin indent on
syntax enable
    ]])



    require("nvim-autopairs").setup()
end

local setup_ts = function()
    local parsers = {
        "typescript",
        "lua",
        "fish",
        "markdown",
        "markdown_inline",
        "rust",
    }



    -- local ts = require("nvim-treesitter")
    require("nvim-treesitter.configs").setup({
        ensure_installed = parsers,
        -- ignore_install = { "rust" },
        highlight = {
            enable = true,
            disable = { "latex" },
            additional_languages = { 'c_sharp' },
            additional_vim_regex_hightlighting = { "latex", "markdown" }
        },
        indent = { enable = true }
    })
    -- ts.install(parsers)
    -- autocmd("PackChanged", {
    --     group = augroup,
    --     callback = function(ev)
    --         local spec = ev.data.spec
    --         if spec and spec.name == "nvim-treesitter" and ev.data.kind == "update" then
    --             vim.schedule(function()
    --                 ts.update()
    --             end)
    --         end
    --     end
    -- })
    -- autocmd("FileType", {
    --     group = augroup,
    --     callback = function(ev)
    --         local ft = ev.match
    --         local lang = vim.treesitter.language.get_lang(ft)
    --         if vim.treesitter.language.add(langd) then
    --             if vim.treesitter.query.get(ft, "indents") then
    --                 vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    --             end
    --             if vim.treesitter.query.get(ft, "folds") then
    --                 vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    --             end
    --             vim.treesitter.start()
    --         end
    --     end
    -- })
end

local setup_fzf = function()
    local fzf = require("fzf-lua")

    map("n", "<leader>s", fzf.files, { desc = "fzf files", noremap = true, silent = true })
    map("n", "<leader>S", fzf.live_grep, { desc = "fzf grep", noremap = true, silent = true })
    fzf.setup({
        winopts = {
            preview = {
                hidden = false
            },
            on_create = function()
                map("t", "<A-j>", "<Down>", { buffer = true, silent = true })
                map("t", "<A-k>", "<Up>", { buffer = true, silent = true })
            end
        },
        keymap = {
            fzf = {
                ["alt-j"] = "preview-down",
            }
        }
    })
end


setup()
setup_ts()
setup_fzf()
