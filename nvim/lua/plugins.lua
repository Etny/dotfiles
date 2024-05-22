vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'voldikss/vim-floaterm' -- Floaterm
    -- Themes
    -- use 'tanvirtin/monokai.nvim'
    use "ellisonleao/gruvbox.nvim"
    use "savq/melange-nvim"
    use "Biscuit-Colorscheme/nvim"
    use "AlexvZyl/nordic.nvim"
    use "olimorris/onedarkpro.nvim"
    use "rebelot/kanagawa.nvim"
    use "luisiacc/gruvbox-baby"

    -- surrounding brackets
    use 'tpope/vim-surround'

    -- autosave
    use({
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
    })

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup {} end
    }

    -- fswitch
    use 'derekwyatt/vim-fswitch'

    -- vim-illuminate
    use 'RRethy/vim-illuminate'

    -- vim-lightline
    use 'itchyny/lightline.vim'

    -- HlArgs
    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- HTML Tags
    use 'windwp/nvim-ts-autotag';

    -- Search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'lewis6991/impatient.nvim'   -- Impatient
    use 'danilamihailov/beacon.nvim' -- Beacon

    -- Hop
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }


    -- File Explorer
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly'
    }

    -- Tabs
    use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

    -- Tagbar
    use 'preservim/tagbar'

    -- Mason
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
        }
    }
    use 'nvim-treesitter/nvim-treesitter'

    -- GLSL
    use { 'timtro/glslView-nvim' }

    -- C
    use 'gauteh/vim-cppman'

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use 'puremourning/vimspector'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
end)
