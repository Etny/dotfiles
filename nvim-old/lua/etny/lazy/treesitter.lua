return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "vimdoc", "luadoc", "lua", "html", "tsx", "javascript", "typescript", "css", "rust", "toml", "cpp", "c",
                "markdown", "markdown_inline", "vue"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
