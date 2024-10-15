require('nvim-treesitter.configs').setup {
	ensure_installed = { "lua", "rust", "toml", "cpp", "c", "css", "markdown", "markdown_inline" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}

vim.opt.conceallevel  = 2
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
