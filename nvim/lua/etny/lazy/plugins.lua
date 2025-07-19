return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_shell = "fish"
        end
    },
    {
        'jubnzv/virtual-types.nvim'
    },
    {
        'mateuszwieloch/automkdir.nvim'
    },
    {
        'ray-x/lsp_signature.nvim',
        event = "InsertEnter"
    },
    {
        'rcarriga/nvim-notify'
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require("nvim-ts-autotag").setup({
            })
        end
    },
    -- {
    --     'pocco81/auto-save.nvim',
    --     config = function()
    --         require("auto-save").setup({
    --             trigger_events = { "InsertLeave" }
    --         })
    --     end
    -- },
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000,    -- needs to be loaded in first
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end
    },
    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/Downloads', '/' },
            -- log_level = 'debug',
        }
    }
}
