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
    {
        'pocco81/auto-save.nvim',
        config = function()
            require("auto-save").setup({
                trigger_events = { "InsertLeave" }
            })
        end
    }
}
