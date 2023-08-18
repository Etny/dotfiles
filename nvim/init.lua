-- IMPORTS
require('vars')
require('plugins')
require('opts')
require('keys')

-- Impatient
require('impatient')


-- Required for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LSP Diagnostics Options


local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({name = 'DiagnosticSignError', text = '⛔'})
sign({name = 'DiagnosticSignWarn', text = '🚸'})
sign({name = 'DiagnosticSignHint', text = '💡'})
sign({name = 'DiagnosticSignInfo', text = '💁'})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

vim.cmd([[
set signcolumn=yes
set updatetime=300
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

