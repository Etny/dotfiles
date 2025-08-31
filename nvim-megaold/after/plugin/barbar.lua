require('bufferline').setup {
    animation = true,
    auto_hide = true, -- Hide when only a single buffer is open
    tabpages = true,
    clickable = true,

    icons = {
        filetype = {
            custom_colors = false,
            enabled = true,
        },
        separator = { left = '▎', right = '' },

        modified = { button = '●' },
        pinned = { button = '車' },

        buffer_index = true,

        alternate = { filetype = { enabled = false } },
        -- current = {buffer_index = true},
        inactive = { button = '×' },
        -- visible = {modified = {buffer_number = false}},
    },

    -- icon_separator_active = '▎',
    -- icon_separator_inactive = '▎',
    -- icon_close_tab = '',
    -- icon_close_tab_modified = '●',
    -- icon_pinned = '車',
}



-- Close empty buffer on startup
vim.api.nvim_create_autocmd('VimEnter', {callback = function()
  if vim.api.nvim_cmd({cmd = 'args'}, {output = true}) == '' then -- if opening neovim without args
    vim.api.nvim_command 'bdelete' -- delete the empty buffer

    -- HACK: the next buffer won't have a filetype for… some reason. just re-set it.
    -- local ft = vim.filetype.match {buf = 0}
    -- vim.api.nvim_buf_set_option(0, 'filetype', ft)
  end
end})
