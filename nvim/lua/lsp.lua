local augroup = vim.api.nvim_create_augroup("etny.cfg", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local map = vim.keymap.set

local setup = function()
    local ls = require("luasnip")
    ls.setup({})
    ls.filetype_set("pandoc", { "markdown", "tex" })
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
    require("blink.cmp").setup({
        snippets = { preset = "luasnip" },
        keymap = {
            preset = 'default',
            ['<A-k>'] = { 'select_prev', 'fallback' },
            ['<A-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },

            ['<A-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<A-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<A-g>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        sources = {
            default = function(ctx)
                if vim.bo.filetype == 'pandoc' then
                    return { 'snippets' }
                else
                    return { "lsp", "snippets", "path" }
                end
            end
        },
        signature = { enabled = true }
    })


    -- vim.lsp.config("ltex", {
    --     settings = {
    --         ltex = {
    --             language = "en-GB"
    --         }
    --     }
    -- })
    --

    vim.filetype.add({
        extension = {
            spade = 'spade'
        }
    })


    vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "vue_ls",
        "rust_analyzer",
        "marksman",
        "clangd",
        "csharp_ls",
        "vhdl_ls",
        -- "ltex"
    })



    autocmd("LspAttach", {
        group = augroup,
        callback = function(ev)
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }

            map("n", "grd", vim.lsp.buf.definition, bufopts)
            map("n", "<leader>A", vim.lsp.buf.code_action, bufopts)


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
                    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
                    local methods = vim.lsp.protocol.Methods
                    if client:supports_method(methods.textDocument_formatting) then
                        vim.lsp.buf.format({ async = false, id = ev.data.client_id })
                    end
                end
            })
        end
    })




    require("fidget").setup()

    vim.cmd([[
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'
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
        ignore_install = { "latex" },
        highlight = {
            enable = true,
            disable = { "latex" },
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
    local noprev = { winopts = { preview = { hidden = false } } }
    local fzf_files = function()
        fzf.files(noprev)
    end

    local fzf_symbols = function()
        fzf.lsp_document_symbols(noprev)
    end

    local fzf_buffers = function()
        fzf.buffers(noprev)
    end

    map("n", "<leader>s", fzf_files, { desc = "fzf files", noremap = true, silent = true })
    map("n", "<leader>S", fzf.live_grep, { desc = "fzf grep", noremap = true, silent = true })
    fzf.setup({ "max-perf" })
end


setup()
setup_ts()
setup_fzf()
