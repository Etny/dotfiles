return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.cmd.colorscheme("onedark")
        vim.opt.termguicolors = true
        require("bufferline").setup({})
    end
}
