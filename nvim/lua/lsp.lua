local augroup = vim.api.nvim_create_augroup("etny.cfg", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local map = vim.keymap.set

local setup = function()
    vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "vue_ls",
        "rust_analyzer",
    })

    autocmd("LspAttach", {
        group = augroup,
        callback = function(ev)
            local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }

            map("n", "grd", vim.lsp.buf.definition, bufopts)

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
                    vim.lsp.buf.format({ async = false, id = ev.data.client_id })
                end
            })
        end
    })

    require("fidget").setup()

    require("blink.cmp").setup({
        keymap = {
            preset = 'default',
            ['<A-k>'] = { 'select_prev', 'fallback' },
            ['<A-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },

            ['<A-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<A-f>'] = { 'scroll_documentation_down', 'fallback' },
            ['<A-g>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        completion = {
            documentation = { auto_show = true }
        }
    })

    require("nvim-autopairs").setup()
end

local setup_ts = function()
    local parsers = {
        "typescript",
        "lua",
        "fish",
        "rust",
    }

    local ts = require("nvim-treesitter")
    ts.install(parsers)
    autocmd("PackChanged", {
        group = augroup,
        callback = function(ev)
            local spec = ev.data.spec
            if spec and spec.name == "nvim-treesitter" and ev.data.kind == "update" then
                vim.schedule(function()
                    ts.update()
                end)
            end
        end
    })
    autocmd("FileType", {
        group = augroup,
        callback = function(ev)
            local ft = ev.match
            local lang = vim.treesitter.language.get_lang(ft)
            if vim.treesitter.language.add(lang) then
                if vim.treesitter.query.get(ft, "indents") then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
                if vim.treesitter.query.get(ft, "folds") then
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                end
                vim.treesitter.start()
            end
        end
    })
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

return {
    setup_lsp = setup,
    setup_treesitter = setup_ts,
    setup_fzf = setup_fzf
}
